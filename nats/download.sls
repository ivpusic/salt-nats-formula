{% from "nats/map.jinja" import nats with context %}

{% set archive = '/tmp/nats-%s.zip'|format(nats.version) %}

nats|cache-archive:
  file.managed:
    - name: {{archive}}
    - source: https://github.com/nats-io/gnatsd/releases/download/v{{nats.version}}/gnatsd-v{{nats.version}}-linux-amd64.zip
    - skip_verify: True
    - user: root
    - group: root
    - unless:
        - test -e {{ archive }}
