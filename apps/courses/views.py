# -*- coding: utf-8 -*-

from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic.base import View
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course, CourseResource, Video
from operation.models import UserFavorite, UserCourse, CourseComments
from utils.mixin_utils import LoginRequiredMixin


# 课程列表
class CourseListView(View):

    def get(self, request):
        all_courses = Course.objects.all().order_by('-add_time')    # 默认按时间倒序排列

        hot_courses = all_courses.order_by('-click_nums')[:3]

        # 搜索处理
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_courses = all_courses.filter(
                Q(name__icontains=search_keywords) |
                Q(desc__icontains=search_keywords) |
                Q(detail__icontains=search_keywords)
            )

        # 排序处理
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_courses = all_courses.order_by('-students')
            elif sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')

        # 分页处理
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_courses, 6, request=request)  # 每页显示个数必须指定
        courses = p.page(page)

        return render(request, 'course-list.html', {
            'all_courses': courses,     # 其中degree要使用get_degree_display
            'hot_courses': hot_courses,
            'sort': sort,
        })


# 课程主页
class CourseHomeView(View):

    def get(self, request, course_id):

        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()

        # 收藏处理
        has_fav_course = False
        has_fav_org = False

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        tag = course.tag
        relate_course = []
        if tag:
            relate_course = Course.objects.filter(tag=tag)[:1]

        return render(request, 'course-detail.html', {
            'course': course,
            'relate_course': relate_course,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org,

        })


# 课程章节（登录才可以访问）
class CourseInfoView(LoginRequiredMixin, View):

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.save()

        # 查询用户是否已经关联（点击过“开始学习”）了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        user_cousers = UserCourse.objects.filter(course=course) # 取用户与课程的关系
        user_ids = [user_couser.user.id for user_couser in user_cousers]        # 提取user_id列表
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)      # 提取列表中用户学习的所有课程

        # 取出所有课程id
        course_ids = [user_couser.course.id for user_couser in all_user_courses]

        # 获取学过该用户学过其他的所有课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]

        all_resources = CourseResource.objects.filter(course=course)

        return render(request, "course-video.html", {
            "course": course,
            "course_resources": all_resources,
            "relate_courses": relate_courses
        })


# 课程评论（登录才可以访问）
class CommentsView(LoginRequiredMixin, View):

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.all().order_by("-id")

        return render(request, "course-comment.html", {
            "course": course,
            "course_resources": all_resources,
            "all_comments": all_comments

        })


# 添加评论（登录才可以访问）
class AddComentsView(LoginRequiredMixin, View):

    def post(self, request):
        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", "")

        if course_id > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加失败"}', content_type='application/json')


# 课程视频（登录才可以访问）
class VideoPlayView(LoginRequiredMixin, View):

    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        course.students += 1
        course.save()

        # 查询用户是否已经关联（点击过“开始学习”）了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        user_cousers = UserCourse.objects.filter(course=course) # 取用户与课程的关系
        user_ids = [user_couser.user.id for user_couser in user_cousers]        # 提取user_id列表
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)      # 提取列表中用户学习的所有课程

        # 取出所有课程id
        course_ids = [user_couser.course.id for user_couser in all_user_courses]

        # 获取学过该用户学过其他的所有课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
        all_resources = CourseResource.objects.filter(course=course)

        return render(request, "course-play.html", {
            "course": course,
            "course_resources": all_resources,
            "relate_courses": relate_courses,
            "video": video,
        })