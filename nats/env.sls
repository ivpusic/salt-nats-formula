nats:
  group:
    - present
  user:
    - present
    - groups:
      - nats
    - require:
      - group: nats
