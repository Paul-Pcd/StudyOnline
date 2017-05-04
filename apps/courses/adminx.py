# -*- coding: utf-8 -*-

import xadmin

from .models import Course, BannerCourse, Lesson, Video, CourseResource
from organization.models import CourseOrg


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):

    list_display = ['name', 'desc', 'detail',
                    'degree', 'learn_times', 'students',
                    'fav_nums', 'image', 'click_nums', 'add_time',
                    'get_lesson_nums','is_banner'
                    ]                                               # 显示字段（函数也可以）
    list_filter = ['name', 'desc', 'detail',
                   'degree', 'learn_times', 'students',
                   'fav_nums', 'image', 'click_nums', 'add_time'
                   ]                                                # 过滤器
    search_fields = ['name', 'desc', 'detail',
                     'degree', 'learn_times', 'students',
                     'fav_nums', 'image', 'click_nums'
                     ]                                              # 搜索栏

    ordering = ['-name']                                            # 排序
    readonly_fields = ['click_nums', 'fav_nums']                    # 只读字段
    exclude = []                                                    # 不显示字段
    relfield_style = 'fk_ajax'                                      # 以AJAX方式加载外键字段：在课程管理中在输入关键字段时才显示列表
    inlines = [LessonInline, CourseResourceInline]                  # 配置内联栏目
    list_editable = ['degree', 'desc']                              # 可（在列表中直接）编辑字段
    # refresh_times = [3, 5]                                        # 定时刷新间隔
    style_fields = {"detail": "ueditor"}                            # 指明某个字段使用的样式

    def queryset(self):         # 过滤出非Banner课程的数据
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    def save_models(self):      # 在保存课程时统计课程机构课程数
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save


# 使用一个model注册两个管理器
class BannerCourseAdmin(object):

    list_display = ['name', 'desc', 'detail',
                    'degree', 'learn_times', 'students',
                    'fav_nums', 'image', 'click_nums', 'add_time'
                    ]
    list_filter = ['name', 'desc', 'detail',
                   'degree', 'learn_times', 'students',
                   'fav_nums', 'image', 'click_nums', 'add_time'
                   ]
    search_fields = ['name', 'desc', 'detail',
                     'degree', 'learn_times', 'students',
                     'fav_nums', 'image', 'click_nums'
                     ]

    ordering = ['-name']
    readonly_fields = ['click_nums', 'fav_nums']
    exclude = []
    relfield_style = 'fk_ajax'
    inlines = [LessonInline, CourseResourceInline]

    # 过滤出Banner课程的数据
    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class LessonAdmin(object):

    list_display = ['course', 'name', 'add_time']
    list_filter = ['course__name', 'name', 'add_time']
    search_fields = ['course', 'name']


class VideoAdmin(object):

    list_display = ['lesson', 'name', 'add_time']
    list_filter = ['lesson__name', 'name', 'add_time']
    search_fields = ['lesson', 'name']


class CourseResourceAdmin(object):

    list_display = ['course', 'name', 'download', 'add_time']
    list_filter = ['course__name', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)