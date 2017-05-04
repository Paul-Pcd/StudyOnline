# StudyOnline
 
 StudyOnline是一个基于Django开发的在线教育平台，实际运行效果见：http://www.yipwinghong.cn/
 

 
## 开发环境
环境 | 版本
---|---
操作系统 | Windows 10 Enterprise (x64)
数据库 | MySQL 5.7.18
开发语言 | Python 2.7.4
后端框架 | Django 1.9
IDE | PyCharm 2017.1 x64

 其中后台管理是基于Django的第三方组件xadmin进行二次开发，支持各种定制功能。
 
 
 
## 使用指南
 1、安装MySQL数据库（root密码设置123456）。

 2、新建数据库：<pre><code>create database studyonline;</code></pre>

 3、Linux下导入数据（Windows下可以使用Navicat for MySQL等工具运行sql文件）：<pre><code>mysqldump -uroot -p123455 studyonline < studyonline.sql
</code></pre>

 4、安装环境依赖包（不同版本操作系统安装方法有差异，见网上具体解决方案）：<pre><code>pip install -r requirements.txt</code></pre>

 5、项目目录下运行：<pre><code>python manage.py runserver</code></pre>

 6、浏览器下访问：<pre><code>127.0.0.1:8000</code></pre>

 7、后台管理：<pre><code>127.0.0.1:8000/xadmin</code></pre>
 其中默认管理帐号和admin，密码123456。
