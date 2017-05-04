# -*- coding: utf-8 -*-

import random

from users.models import EmailVerifyRecord
from django.core.mail import send_mail
from StudyOnline.settings import EMAIL_FROM


def random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    for i in range(randomlength):
        str += chars[random.randrange(0, len(chars))]
    return str


def send_register_email(email, send_type='register'):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == 'register':
        email_title = '学院在线网注册激活链接'
        email_body = '请点击下面链接激活您的账号：http://www.yipwinghong.cn/active/{0}'.format(code)
    elif send_type == 'forget':
        email_title = '学院在线网密码重置链接'
        email_body = '请点击下面链接激活您的账号：http://www.yipwinghiong.cn/reset/{0}'.format(code)
    elif send_type == 'update_email':
        email_title = '学院在线网邮箱修改链接'
        email_body = '你的邮箱验证码为： {0}'.format(code)

    send_mail(email_title, email_body, EMAIL_FROM, [email])


