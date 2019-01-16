sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
# sudo rm -rf /etc/nginx/sites-enabled/default

sudo /etc/init.d/gunicorn restart

# sudo ln -sf /home/box/web/etc/django_conf.py /etc/gunicorn.d/django_conf.py
# sudo gunicorn -c /etc/gunicorn.d/django_conf.py ask.wsgi:application

gunicorn -b 0.0.0.0:8080 --pythonpath /home/box/web/ hello:app &     
gunicorn -b 0.0.0.0:8000 --pythonpath /home/box/web/ask ask.wsgi:application & 