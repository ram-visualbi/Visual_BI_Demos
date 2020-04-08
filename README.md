# Visual_BI_Demos
Demos from VisualBI

Add this profile in your profiles.yml:

array_tech:
  target: dev
  outputs:
   dev:
    type: snowflake
    account: <your_account_name>
    user: <user_name>
    password: <password>
    role: <role>
    database: <database>
    warehouse: <warehouse>
    schema: <schema_name>
    threads: 1
    client_session_keep_alive: False
