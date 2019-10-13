
include:
- .packages

{{ sls }}.wifi-config:
  file.managed:
    - name: /etc/uwsgi.d/wifi-104-server.ini
    - source: salt://{{ slspath }}/_files/wifi-104-server.ini
    - user: uwsgi
    - group: uwsgi
    - makedirs: true
    - mode: 644
    - require:
      - sls: {{ slsdotpath }}.packages

{{ sls }}.uwsgi-config:
  file.managed:
    - name: /etc/uwsgi.ini 
    - source: salt://{{ slspath }}/_files/uwsgi.ini
    - user: uwsgi
    - group: uwsgi
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
    - target: /root/smartthings-src/apps/wifi-104-server
    - require:
      - git: {{ sls }}.app-src

