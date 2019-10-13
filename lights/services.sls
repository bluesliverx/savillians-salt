
include:
- .packages
- .files

{{ sls }}.service:
  service.running:
    - name: nginx
    - enable: true
    - watch:
      - sls: {{ slsdotpath }}.packages
      - sls: {{ slsdotpath }}.files
