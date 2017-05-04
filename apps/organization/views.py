# -*-  coding:utf-8 -*-
from django.views.generic import View
from django.shortcuts import render
from django.http import HttpResponse
from django.db.models import Q
from pure_pagination import Paginator, PageNotAnInteger

from .models import CourseOrg, CityDict, Teacher
from courses.models import Course
from operation.models import UserFavorite

from forms import UserAskForm


class OrgListView(View):

    # 课程机构列表
    def get(self, request):
        all_orgs = CourseOrg.objects.all().order_by('-courses_nums')      # 取出所有培训机构

        # 计算机构的课程数
        for org in all_orgs:
            org.courses_nums = org.course_set.all().count()
            org.save()

        hot_orgs = all_orgs.order_by('-click_nums')[:3]
        all_citys = CityDict.objects.all()      # 取出所有城市

        # 搜索处理
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_orgs = all_orgs.filter(
                Q(name__icontains=search_keywords) |
                Q(desc__icontains=search_keywords)
            )

        # 取出筛选城市
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 取出筛选机构类型
        category = request.GET.get('ct', '')
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 排序处理
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses_nums':
                all_orgs = all_orgs.order_by('-courses_nums')

        org_nums = all_orgs.count()

        # 分页处理
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs, 5, request=request)     # 每页显示个数必须指定
        orgs = p.page(page)

        return render(request, 'org-list.html', {       # 获取所有的机构和城市
            # {% for course_org in all_orgs.object_list %}
            'all_orgs': orgs,
            'all_citys': all_citys,
            'org_nums': org_nums,
            'city_id': city_id,
            'category': category,
            'hot_orgs': hot_orgs,
            'sort': sort,
        })
# 在模板取用图片时注意<img ...data-url="{{ MEDIA_URL }}{{ course_org.image }}>


# 用户添加咨询
class AddUserAskView(View):

    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)       # 保存到数据库
            # 异步操作：提交表单（通过js使用ajax控制提交）不会刷新整个页面，返回一个json
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg":"添加出错"}', content_type='application/json')


# 机构首页
class OrgHomeView(View):

    def get(self, request, org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums += 1
        course_org.save()

        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        # course下有外键course_org表示所属的机构
        # 所以course_org可以反向获取该机构下所有课程（对外键使用course_set内置变量）
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html', {
            'all_courses': all_courses,
            'all_teachers': all_teachers,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构课程页
class OrgCourseView(View):

    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()
        return render(request, 'org-detail-course.html', {
            'all_courses': all_courses,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构介绍页
class OrgDescView(View):

    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构讲师页
class OrgTeacherView(View):

    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()
        return render(request, 'org-detail-teachers.html', {
            'course_org': course_org,
            'current_page': current_page,
            'all_teachers': all_teachers,
            'has_fav': has_fav,
        })


# 用户收藏/取消收藏
class AddFavView(View):

    def post(self, request):
        fav_id = int(request.POST.get('fav_id', 0))
        fav_type = int(request.POST.get('fav_type', 0))
        if not request.user.is_authenticated():     # 判断用户登录状态
            return HttpResponse('{"status": "fail", "msg":"用户未登录"}', content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)
        if exist_records:       # 收藏记录存在表示用户当前操作为取消收藏
            exist_records.delete()

            if fav_type == 1:
                course = Course.objects.get(id=fav_id)
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif fav_type == 2:
                org = CourseOrg.objects.get(id=fav_id)
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            elif fav_type == 3:
                teacher = Teacher.objects.get(id=fav_type)
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return HttpResponse('{"status": "fail", "msg":"收藏"}', content_type='application/json')

        else:
            user_fav = UserFavorite()
            if fav_id > 0 and fav_type > 0:
                user_fav.user = request.user
                user_fav.fav_id = fav_id
                user_fav.fav_type = fav_type
                user_fav.save()

                if fav_type == 1:
                    course = Course.objects.get(id=fav_id)
                    course.fav_nums += 1
                    course.save()
                elif fav_type == 2:
                    org = CourseOrg.objects.get(id=fav_id)
                    org.fav_nums += 1
                    org.save()
                elif fav_type == 3:
                    teacher = Teacher.objects.get(id=fav_type)
                    teacher.fav_nums += 1
                    teacher.save()
                return HttpResponse('{"status": "success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status": "fail", "msg":"收藏出错"}', content_type='application/json')


# 课程讲师页
class TeacherListView(View):

    def get(self, request):
        all_teachers = Teacher.objects.all()
        teacher_nums = Teacher.objects.count()

        hot_teachers = Teacher.objects.order_by('-click_nums')[:3]

        # 搜索处理
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teachers = all_teachers.filter(
                Q(name__icontains=search_keywords) |
                Q(work_company__icontains=search_keywords) |
                Q(work_position__icontains=search_keywords)
            )

        sort = request.GET.get('sort', '')
        if sort == 'hot':
            all_teachers = all_teachers.order_by('-click_nums')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers, 5, request=request)
        teachers = p.page(page)

        return render(request, 'teachers-list.html', {
            'all_teachers': teachers,
            'teacher_nums': teacher_nums,
            'hot_teachers': hot_teachers,
            'sort': sort,
        })


class TeacherDetailView(View):

    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()

        all_courses = Course.objects.filter(teacher=teacher)

        has_teacher_faved = False
        has_org_faved = False

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher.id):
                has_teacher_faved = True
            if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
                has_org_faved = True

        hot_teachers = Teacher.objects.all().order_by("-click_nums")[:3]    # 讲师排行

        return render(request, "teacher-detail.html", {
            "teacher":teacher,
            "all_courses": all_courses,
            "hot_teachers": hot_teachers,
            "has_teacher_faved": has_teacher_faved,
            "has_org_faved": has_org_faved
        })


