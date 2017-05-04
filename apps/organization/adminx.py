# -*- coding: utf-8 -*-

import xadmin

from .models import CityDict, CourseOrg, Teacher


class TeacherInline(object):
    model = Teacher
    extra = 0


class CourseOrgAdmin(object):

    list_display = ['name', 'desc', 'click_nums',
                    'fav_nums', 'image', 'address',
                    'city', 'add_time']                 # 显示字段
    list_filter = ['name', 'desc', 'click_nums',
                   'fav_nums', 'image', 'address',
                   'city__name', 'add_time']            # 过滤器
    search_field = ['name', 'desc', 'click_nums',
                    'fav_nums', 'image', 'address',
                    'city']                             # 搜索栏

    ordering = ['-name']                                # 排序
    readonly_fields = ['click_nums', 'fav_nums']        # 只读字段
    exclude = []                                        # 不显示字段
    relfield_style = 'fk_ajax'                          # 以AJAX方式加载外键字段：在课程管理中在输入关键字段时才显示列表
    inlines = [TeacherInline]                           # 配置内联栏目


class CityDictAdmin(object):

    list_display = ['name', 'desc', 'add_time']
    list_filter = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']


class TeacherAdmin(object):

    list_display = ['org', 'name', 'work_years',
                    'work_position', 'point', 'click_nums',
                    'fav_nums', 'add_time']
    list_filter = ['org__name', 'name', 'work_years',
                   'work_position', 'point', 'click_nums',
                   'fav_nums', 'add_time']
    search_field = ['org', 'name', 'work_years',
                    'work_position', 'point', 'click_nums',
                    'fav_nums']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)