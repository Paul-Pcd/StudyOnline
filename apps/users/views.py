# -*- coding:utf-8 -*-

import json

from django.shortcuts import render, render_to_response
from django.views.generic.base import View                  # 继承View实现验证类
from django.contrib.auth import authenticate, login, logout # 验证用户登录、保存登录状态
from django.contrib.auth.hashers import make_password       # 对密码字段加密
from django.contrib.auth.backends import ModelBackend       # 重载验证方法
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.db.models import Q                              # 集合运算

from pure_pagination import Paginator, PageNotAnInteger

from utils.mixin_utils import LoginRequiredMixin
from utils.email_send import send_register_email
from operation.models import UserCourse
from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm, UploadImageForm, UserInfoForm
from operation.models import UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from courses.models import Course

'''
def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)     
        if user is not None:        # 成功则返回model对象，否则为空
            login(request, user)        # 在request中写入了登录信息
            return render(request, 'index.html')
        else:
            return render(request, 'login.html', {'msg': '用户名或密码错误！'})  # 验证失败返回错误信息

    elif request.method == 'GET':
        return render(request, 'login.html', {})
'''


# 首页
class IndexView(View):
    def get(self, request):

        all_banners = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]

        return render(request, 'index.html', {
            'all_banners': all_banners,
            'courses': courses,
            'banner_courses': banner_courses,
            'course_orgs': course_orgs,
        })


# 重载验证方法（支持邮箱和用户名）
class CustomBackend(ModelBackend):

    # 被Django自动调用的验证方法
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            # 使用get方法：为空/不唯一都失败
            # 支持两种登录方式：用户名匹配或邮箱匹配都可以
            # （密码为密文存储，不能直接匹配）
            if user.check_password(password):       # 把从客户端传来的明文密码加密与密码作对比
                return user
        except Exception as e:
            return None


# 用户登录（自定义验证）
class LoginView(View):

    def get(self, request):
        return render(request, 'login.html', {})

    def post(self, request):
        login_form = LoginForm(request.POST)    # 用请求中包含的信息实例化表单类
        if login_form.is_valid():               # 验证提交的表单信息是否有误：必填项、字段长度等
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)  # 成功则返回user对象，否则为空
            if user is not None:
                if user.is_active:
                    # 在request中写入了登录信息（session id，保存在数据库session表，退出登录时清除）
                    login(request, user)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html', {'msg': '用户未激活'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误！'})
        else:
            return render(request, 'login.html', {'login_form': login_form})  # 验证失败返回错误信息


# 用户登出
class LogoutView(View):

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


# 用户注册
class RegisterView(View):

    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = request.POST.get('email', '')
            if UserProfile.objects.filter(email=username):  # 邮箱已存在
                return render(request, 'register.html', {'register_form': register_form, 'msg': '用户已存在'})
            password = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = username
            user_profile.password = make_password(password)
            user_profile.email = username
            user_profile.is_active = False      # 新注册账号默认未激活，发送邮件激活
            send_register_email(username, 'register')
            user_profile.save()

            # 写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = '欢迎注册慕学在线网'
            user_message.save()

            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form': register_form})


# 邮箱激活
class ActiveUserView(View):
    # 每当用户点击邮箱链接时匹配url，从验证链接号查询该用户的邮箱，并把该用户激活状态置为True
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:   # 邮箱链接验证失败
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


# 忘记密码
class ForgetPwdView(View):

    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {'forget_form': forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', '')
            send_register_email(email, 'forget')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form})


# 邮箱验证（验证邮箱链接）
class ResetView(View):

    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html', {'email': email})
        else:   # 邮箱链接验证失败
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


# 重置密码
class ModifyPwdView(View):

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {'email': email, 'msg': '密码不一致'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email': email, 'msg': 'modify_form'})


# 个人中心
class UserInfoView(LoginRequiredMixin, View):

    def get(self, request):
        current_page = 'home'
        return render(request, 'usercenter-info.html', {
            'current_page': current_page,
        })

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


# 上传头像
class UploadImageView(LoginRequiredMixin, View):

    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail"}', content_type='application/json')


# 修改密码
class UpdatePwdView(LoginRequiredMixin, View):

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                return HttpResponse('{"status": "fail", "msg": "密码不一致"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


# 发送邮箱验证码
class SendEmailCodeView(LoginRequiredMixin, View):

    def get(self, request):
        email = request.GET.get('email', '')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email": "邮箱已存在"}', content_type='application/json')
        send_register_email(email, 'update_email', )
        return HttpResponse('{"status": "success"}', content_type='application/json')


# 修改邮箱
class UpdateEmailView(LoginRequiredMixin, View):

    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            request.user.email = email
            request.user.save()
            return HttpResponse('{"email": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"email": "验证码出错"}', content_type='application/json')


# 用户课程
class MyCourseView(LoginRequiredMixin, View):

    def get(self, request):
        current_page = 'course'
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request, 'usercenter-mycourse.html', {
            'user_courses': user_courses,
            'current_page': current_page,
        })


# 收藏机构
class MyFavOrgView(LoginRequiredMixin, View):

    def get(self, request):
        current_page = 'fav'
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)

        # 从收藏机构id列表获取所有收藏机构对象
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, 'usercenter-fav-org.html', {
            'org_list': org_list,
            'current_page': current_page,
        })


# 收藏讲师
class MyFavTeacherView(LoginRequiredMixin, View):

    def get(self, request):

        current_page = 'fav'
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)

        # 从收藏机构id列表获取所有收藏机构对象
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, 'usercenter-fav-teacher.html', {
            'teacher_list': teacher_list,
            'current_page': current_page,
        })


# 收藏课程
class MyFavCourseView(LoginRequiredMixin, View):

    def get(self, request):

        current_page = 'fav'
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)

        # 从收藏机构id列表获取所有收藏机构对象
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course and course_list.append(course)
        return render(request, 'usercenter-fav-course.html', {
            'course_list': course_list,
            'current_page': current_page,
        })


# 用户消息
class MyMessageView(LoginRequiredMixin, View):

    def get(self, request):

        current_page = 'message'
        all_messages = UserMessage.objects.filter(user=request.user.id)

        # 访问该栏目后全部消息置为已读
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 分页处理
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_messages, 4, request=request)  # 每页显示个数必须指定
        messages = p.page(page)

        return render(request, 'usercenter-message.html', {
            'messages': messages,
            'current_page': current_page,
        })


# 全局404处理函数
def page_not_found(request):
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


# 全局500处理函数
def page_error(request):
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response

