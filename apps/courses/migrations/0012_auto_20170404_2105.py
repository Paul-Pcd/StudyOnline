# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-04-04 21:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0011_auto_20170404_2105'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='teacher_tell',
            field=models.CharField(default='', max_length=300, verbose_name='\u8001\u5e08\u544a\u8bc9\u4f60'),
        ),
        migrations.AlterField(
            model_name='course',
            name='you_need_to_know',
            field=models.CharField(default='', max_length=300, verbose_name='\u8bfe\u7a0b\u987b\u77e5'),
        ),
    ]