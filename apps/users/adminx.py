# -*- coding:utf-8 -*-

import xadmin
from xadmin import views

# 使用xadmin的用户管理插件
from xadmin.plugins.auth import UserAdmin


from .models import UserProfile, EmailVerifyRecord, Banner


# 也可以直接在源码中修改
class UserProfileAdmin(UserAdmin):

    # 栏目图标（从官网下载最新版本，并修改vendor/css文件中的font awesome）
    model_icon = 'fa fa-user'

    # 重载用户管理源码中的函数
    def get_form_layout(self):
        if self.org_obj:
            self.form_layout = (
                Main(
                    Fieldset('',
                             'username', 'password',
                             css_class='unsort no_title'
                             ),
                    Fieldset(_('Personal info'),
                             Row('first_name', 'last_name'),
                             'email'
                             ),
                    Fieldset(_('Permissions'),
                             'groups', 'user_permissions'
                             ),
                    Fieldset(_('Important dates'),
                             'last_login', 'date_joined'
                             ),
                ),
                Side(
                    Fieldset(_('Status'),
                             'is_active', 'is_staff', 'is_superuser',
                             ),
                )
            )
        return super(UserAdmin, self).get_form_layout()


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = 'GMOOC后台管理系统'
    site_footer = 'GMOOC'
    menu_style = 'accordion'

'''
class UserProfileAdmin(object):

    list_display = ['nick_name', 'birthday', 'gender', 'address', 'mobile', 'image']
    search_fields = ['nick_name', 'birthday', 'gender', 'address', 'mobile', 'image']
    list_filter = ['nick_name', 'birthday', 'gender', 'address', 'mobile', 'image']
'''


class EmailVerifyRecordAdmin(object):

    list_display = ['code', 'email', 'send_type', 'send_time']      # 显示字段
    search_fields = ['code', 'email', 'send_type']                  # 搜索栏
    list_filter = ['code', 'email', 'send_type', 'send_time']       # 过滤器


class BannerAdmin(object):

    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


# 卸载django自带的User，使用自定义User app
# from django.contrib.auth.models import User
# xadmin.site.unregister(User)
# xadmin.site.register(UserProfile, UserProfileAdmin)

xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)

xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)




