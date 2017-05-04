# -*- coding: utf-8 -*-

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


# 访问（继承该超类的）视图类的用户必须已登录
class LoginRequiredMixin(object):

    @method_decorator(login_required(login_url='/login/'))  # 未登录用户请求时自动跳转到login.html
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)