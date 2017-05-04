# -*- coding: utf-8 -*-

from django.conf.urls import url, include
from views import OrgListView,  OrgHomeView, OrgCourseView, OrgDescView, OrgTeacherView
from views import AddUserAskView, AddFavView
from views import TeacherListView, TeacherDetailView

urlpatterns = [

    url(r'^list/$', OrgListView.as_view(), name='org_list'),    # 此时通过http://127.0.0.1:8000/org/list/访问
    # 指定命名空间后，base.html修改为：<a href="{% url 'org:org_list' %}">授课机构</a>
    url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(), name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(), name='org_course'),
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name='org_desc'),
    url(r'^teacher/(?P<org_id>\d+)/$', OrgTeacherView.as_view(), name='org_teacher'),

    # 添加/取消收藏
    url(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),

    # 课程讲师
    url(r'^teacher/list/$', TeacherListView.as_view(), name='teacher_list'),

    # 讲师详情
    url(r'^teacher/detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name='teacher_detail'),

]
