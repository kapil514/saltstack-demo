#Mapping Example
#
{% set apache = salt.grains.filter_by({
     'Debian':{
        'pkg': 'apache2',
        'srv':'apache2',
     },
     'RedHat':{
        'pkg': 'httpd',
        'srv': 'httpd',
     },
})%}


apache_install:
  pkg.installed:
    - name: {{apache.pkg}}
   

service_apache:
  service.running:
    - name: {{apache.pkg}}
   #Explicitly enable the service to manage Redhat as well
    - enable: True

welcome_page:
  file.managed:
    - name: /var/www/html/index.html
    - contents: |
        <!doctype html>
        <body>
        <h1> Hello, World?</h1>
        </body>