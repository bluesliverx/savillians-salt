
include:
- .packages
- .files

{{ sls }}.uwsgi:
  service.running:
    - name: uwsgi
    - enable: true
    - watch:
      - sls: {{ slsdotpath }}.packages
      - sls: {{ slsdotpath }}.files

{{ sls }}.nginx:
  service.running:
    - name: nginx
    - enable: true
    - watch:
      - sls: {{ slsdotpath }}.packages
      - sls: {{ slsdotpath }}.files
