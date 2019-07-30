{% from "apache/map.sls" import apache with context %} 
{% set version = salt.pillar.get('version', 'master') %}

include:
  - apache

myapp:
  git.latest:
    - name: https://github.com/saltstack-formulas/haproxy-formula.git
    - rev: {{ version }}
    - force_reset: True
    - target: /var/www/myapp
    - watch_in:
      - service: service_apache

drain_apache:
  module.run:
    - name: service.stop
    - m_name: {{ apache.srv }}
    - prereq:
      - git: myapp

notify_of_fail:
  event.send:
    - name: mycom/myapp/fail_deploy
    - onfail:
      - git: myapp
