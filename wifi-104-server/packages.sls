
{{ sls }}:
  pkg.installed:
    - pkgs:
      - nginx
      - uwsgi

