/etc/nats.conf:
  file.managed:
    - source: salt://nats/files/nats.conf
    - template: jinja
    - user: root
    - group: root
