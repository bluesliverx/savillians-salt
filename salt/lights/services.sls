
include:
- .packages
- .services

{{ sls }}.service:
  service.running:
    - name: nginx
    - enable: true
    - watch:
      - sls: {{ slsdotpath }}.packages
      - sls: {{ slsdotpath }}.services
