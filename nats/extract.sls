{% from "nats/map.jinja" import nats with context %}

{% set archive = '/tmp/nats-%s.zip'|format(nats.version) %}

nats|extract-archive:
  file.directory:
    - names:
        - {{ nats.base_dir }}
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - unless:
        - test -d {{ nats.base_dir }}
    - recurse:
        - user
        - group
        - mode

  archive.extracted:
    - name: {{ nats.base_dir }}
    - source: {{archive}}
    - archive_format: zip
    - overwrite: True
    - clean: True
    - user: root
    - group: root
    - watch:
      - file: nats|cache-archive
    - unless:
      - test -d {{nats.base_dir}}/gnatsd-v{{nats.version}}-linux-amd64/
