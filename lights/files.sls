
include:
- .packages

{{ sls }}.uwsgi-config:
  file.managed:
    - name: /etc/uwsgi.d/wifi-104-server.ini 
    - source: salt://{{ slspath }}/files/uwsgi.conf
    - user: uwsgi
    - group: uwsgi
    - mode: 644
    - require:
      - sls: {{ slsdotpath }}.packages

