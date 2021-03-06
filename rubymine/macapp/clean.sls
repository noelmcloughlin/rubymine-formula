# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family == 'MacOS' %}

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import rubymine with context %}

rubymine-macos-app-clean-files:
  file.absent:
    - names:
      - {{ rubymine.dir.tmp }}
                  {%- if grains.os == 'MacOS' %}
      - {{ rubymine.dir.path }}/{{ rubymine.pkg.name }}*{{ rubymine.edition }}*.app
                  {%- else %}
      - {{ rubymine.dir.path }}
                  {%- endif %}

    {%- else %}

rubymine-macos-app-clean-unavailable:
  test.show_notification:
    - text: |
        The rubymine macpackage is only available on MacOS

    {%- endif %}
