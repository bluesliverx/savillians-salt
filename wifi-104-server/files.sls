
include:
- .packages

{{ sls }}.wifi-config:
  file.managed:
    - name: /usr/local/etc/uwsgi/ini.d/wifi-104-server.ini
    - source: salt://{{ slspath }}/_files/wifi-104-server.ini
    - user: uwsgi
    - group: uwsgi
    - makedirs: true
    - mode: 644
    - require:
      - sls: {{ slsdotpath }}.packages

{{ sls }}.uwsgi-config:
  file.managed:
    - name: /usr/local/etc/uwsgi/uwsgi.ini
    - source: salt://{{ slspath }}/_files/uwsgi.ini
    - user: uwsgi
    - group: uwsgi
    - makedirs: true
    - mode: 644
    - require:
      - sls: {{ slsdotpath }}.packages

{{ sls }}.nginx-config:
  file.managed:
    - name: /usr/local/etc/nginx/nginx.conf
    - source: salt://{{ slspath }}/_files/nginx.conf
    - mode: 644
    - require:
      - sls: {{ slsdotpath }}.packages

{{ sls }}.app-src:
  git.latest:
    - name: https://github.com/bluesliverx/smartthings-src.git
    - target: /root/smartthings-src

{{ sls }}.app-link:
  file.symlink:
    - name: /home/uwsgi/wifi-104-server
    - user: uwsgi
    - group: uwsgi
    - makedirs: true
    - target: /root/smartthings-src/apps/wifi-104-server
    - require:
      - git: {{ sls }}.app-src

{{ sls }}.install-reqs:
  pip.installed:
    - requirements: /root/smartthings-src/apps/wifi-104-server/requirements.txt
    - require:
      - file: {{ sls }}.app-link

{{ sls }}.run-dir:
  file.directory:
    - name: /var/run/uwsgi
    - user: uwsgi
    - group: uwsgi

