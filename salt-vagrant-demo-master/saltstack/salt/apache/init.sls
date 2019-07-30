#Mapping Example
#
{% from "apache/map.sls" import apache with context %}


apache_install:
  pkg.installed:
    - name: {{apache.pkg}}
   
service_apache:
  service.running:
    - name: {{apache.pkg}}
   #Explicitly enable the service to manage Redhat as well
    - enable: True
    #- require:
    #  - pkg: apache_install
    #- watch:
    #  - file: some_config

#some_config:
#  file.managed:
#    - name: /tmp/foo
#    - contents: fo12jko
