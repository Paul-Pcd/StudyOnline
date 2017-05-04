# -*- coding: utf-8 -*-

from django.conf.urls import url, include

from views import CourseListView, CourseHomeView, CourseInfoView, CommentsView, AddComentsView, VideoPlayView
urlpatterns = [
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
    url(r'^home/(?P<course_id>\d+)/$', CourseHomeView.as_view(), name='course_home'),
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='course_info'),

    # 课程评论
    url(r'^comment/(?P<course_id>\d+)/$', CommentsView.as_view(), name="course_comments"),

    # 添加课程评论
    url(r'^add_comment/$', AddComentsView.as_view(), name="add_comment"),

    # 添加课程评论
    url(r'^video/(?P<video_id>\d+)/$', VideoPlayView.as_view(), name="video_play"),

]
