include:
  - apache

{% set name = salt.pillar.get('name') %}

valid_pillar_value:
  test.check_pillar:
    - present:
        - name
    - failhard: True

welcome_page:
  file.managed:
    - name: /var/www/html/index.html
    - contents: |
        <!doctype html>
        <body>
        <h1> Hello, {{name}} </h1>

        </body>
    - watch_in:
      - service: service_apache
