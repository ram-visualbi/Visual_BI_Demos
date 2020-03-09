# Visual_BI_Demos
Demos from VisualBI

Add this profile in your profiles.yml:

array_tech:
  target: dev
  outputs:
   dev:
    type: snowflake
    account: visualbi.east-us-2.azure
    user: <user_name>
    password: <password>
    role: DBT_USR
    database: SF_TRYOUTS
    warehouse: SF_TRYOUTS_WH
    schema: S4H_VBI_POC
    threads: 1
    client_session_keep_alive: False
