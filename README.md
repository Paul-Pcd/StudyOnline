# StudyOnline
StudyOnline是一个基于Django开发的在线学习网站，实际运行效果见：http://www.yipwinghong.cn/      
- 后台管理模块替换为Django第三方组件xadmin，添加权限（用户、分组）管理，富文本编辑，Excel表格导入功能，支持自定义插件。  
- 支持关键词（课程、机构、讲师）全局搜索。
 
## 开发环境
环境 | 版本
---|---
操作系统 | Windows 10 Enterprise (x64)
数据库 | MySQL 5.7.18
开发语言 | Python 2.7.4
后端框架 | Django 1.9
IDE | PyCharm 2017.1 x64

 
## 使用方法
1、安装MySQL数据库（root密码设置123456）。

2、新建数据库：<pre><code>create database studyonline;</code></pre>

3、Linux下导入数据（Windows下可以使用Navicat for MySQL等工具运行sql文件）：<pre><code>mysqldump -uroot -p123455 studyonline < studyonline.sql
</code></pre>

4、安装环境依赖包（不同版本操作系统安装方法有差异，见网上具体解决方案）：<pre><code>pip install -r requirements.txt</code></pre>

5、项目目录下运行：<pre><code>python manage.py runserver</code></pre>

6、浏览器下访问：<pre><code>127.0.0.1:8000</code></pre>

7、后台管理：<pre><code>127.0.0.1:8000/xadmin</code></pre>
其中默认管理帐号和admin，密码123456。


## 应用部署
使用Nginx + uWSGI在服务器上部署Django应用：      
1、安装Nginx：
从[Nginx官网](http://nginx.org/)上下载源码包并解压、编译安装（其中还需要安装依赖包pcre，以CentOS为例）：
<pre><code>yum install -y pcre-devel	
tar -zxvf nginx-1.6.3.tar.gz
./configure --prefix=/usr/local/nginx --with-pcre
make
make install</code></pre>
2、写入基本配置（nginx/conf/nginx.conf）：
<pre><code>user root;
...
http {
    ...
    server {
        listen 80;                                            # 把来自80端口的访问转发到uWSGI的8000端口
        server_name www.yipwinghong.cn 192.168.1.1;           # 指定域名和ip
        # ...
        location / {
            include uwsgi_params;
            uwsgi_pass 127.0.0.1:8000;
            uwsgi_read_timeout 2;
            # ...
        }
        location static/ {
            alias /root/StudyOnline/static/;                  # 静态文件目录
        }
        location media/ {
            alias /root/StudyOnline/media/;                   # 媒体文件目录
        }
    }
}
</code></pre>
3、安装MySQL（注意修改密码、绑定ip地址、授权给指定的ip和用户访问），具体见网上教程。       
4、安装UWSGI：
<pre><code>pip install uwsgi</code></pre>
在项目根目录下测试启动，成功启动后在浏览器下访问127.0.0.1:8000可见项目首页：
<pre><code>uwsgi --http:8000 --module StudyOnline.wsgi</code></pre>
5、在项目根目录下创建uwsgi配置文件（uwsgi.ini）并写入：
<pre><code>[uwsgi]
chdir           = /root/MxOnline
module          = StudyOnline.wsgi
master          = true
processes       = 10
socket          = :8000
vacuum          = true
virtualenv      =                       # 虚拟环境路径，没有可以忽略
</code></pre>
6、修改项目配置文件（settings.py）：
<pre><code>DEBUG = False        # 生产环境必须关闭debug
...
STATIC_ROOT = os.path.join(BASE_DIR, "static/")
</code></pre>
7、把项目的静态文件拉到同一个目录：
<pre><code>python manage.py collectstatic</code></pre>
8、启动测试：
<pre><code>/etc/init.d/nginx start
uwsgi --ini uwsgi.ini &</code></pre>
浏览器下访问127.0.0.1可见项目首页。
