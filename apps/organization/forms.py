# -*- coding: utf-8 -*-

import re

from django import forms

from operation.models import UserAsk


# modelform：直接从model转化为form
# 可根据原model字段的定义来验证，也支持直接save
class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']     # 选择继承的原model的字段

    # 验证手机号码时候合法，初始化表单时自动调用
    def clean_mobile(self):
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = '^1[358]\d{9}$|^147\d{8}$|^176\d{8}$'
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u'手机号码非法', code='mobile_invalid')


