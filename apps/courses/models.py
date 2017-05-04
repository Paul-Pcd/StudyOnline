# _*_ coding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

from organization.models import CourseOrg, Teacher

from DjangoUeditor.models import UEditorField


class Course(models.Model):
    is_banner = models.BooleanField(default=False, verbose_name=u'是否轮播')
    teacher = models.ForeignKey(Teacher, verbose_name=u'讲师', null=True, blank=True)
    course_org = models.ForeignKey(CourseOrg, verbose_name=u'课程机构', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name=u'课程名')
    desc = models.CharField(max_length=300, verbose_name=u'课程描述')
    detail = UEditorField(verbose_name=u"课程详情", width=600, height=300, imagePath="courses/ueditor/",
                          filePath="courses/ueditor/", default='')
    degree = models.CharField(verbose_name=u'难度', choices=(('1', '初级'), ('2', '中级'), ('3', '高级')), max_length=5)
    learn_times = models.IntegerField(default=0, verbose_name=u'学习时长')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name=u'封面图', max_length=100)
    click_nums = models.IntegerField(default=0, verbose_name=u'点击数')
    add_time = models.DateField(default=datetime.now, verbose_name=u'添加时间')
    teacher = models.ForeignKey(Teacher, verbose_name=u"讲师", null=True, blank=True)
    category = models.CharField(max_length=20, verbose_name=u'课程类别', default=u'后端开发')
    you_need_to_know = models.CharField(max_length=300, verbose_name=u'课程须知', default='')
    teacher_tell = models.CharField(max_length=300, verbose_name=u'老师告诉你', default='')

    # 相同标签的课程用作相关推荐
    tag = models.CharField(default='', verbose_name=u'课程标签', max_length=10)

    class Meta:
        verbose_name = u'课程'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    # 获取课程章节数
    def get_lesson_nums(self):
        return self.lesson_set.all().count()
    get_lesson_nums.short_description = u'章节数'

    # 在管理页面中嵌入HTML代码
    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.projectsedu.com'>跳转</>")
    go_to.short_description = u'跳转'

    # 获取该课程学习用户
    def get_users_courses(self):
        return self.usercourse_set.all()[:5]

    # 获取讲师数
    def get_teacher_nums(self):
        return self.course_org.teacher_set.all().count()

    # 获取课程章节
    def get_course_lesson(self):
        return self.lesson_set.all().order_by('name')


class BannerCourse(Course):
    class Meta:
        verbose_name = u'轮播课程'
        verbose_name_plural = verbose_name
        proxy = True        # 只使用一张表


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'章节名')
    add_time = models.DateField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    # 获取章节视频
    def get_lesson_video(self):
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name=u'章节')
    name = models.CharField(max_length=100, verbose_name=u'视频名')
    add_time = models.DateField(default=datetime.now, verbose_name=u'添加时间')
    url = models.CharField(max_length=200, verbose_name=u'访问地址', default=u'')
    learn_times = models.IntegerField(default=0, verbose_name=u'学习时长')

    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'名称')
    download = models.FileField(upload_to='course/resource/%Y/%m', verbose_name=u'资源文件', max_length=100)
    add_time = models.DateField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name