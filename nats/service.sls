/etc/systemd/system/nats.service:
  file.managed:
    - source: salt://nats/files/nats.service
    - template: jinja
    - user: root
    - group: root

nats_service:
  service.running:
    - name: nats
    - enable: True
    - restart: True
    - watch:
      - file: /etc/systemd/system/nats.service
      - file: /etc/nats.conf
