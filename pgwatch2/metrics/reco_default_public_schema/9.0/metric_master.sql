select
  'default_public_schema_privs'::text as tag_reco_topic,
  nspname::text as tag_object_name,
  'REVOKE CREATE ON SCHEMA public FROM PUBLIC;'::text as recommendation,
  'only authorized users should be allowed to create new objects'::text as extra_info
from
  pg_namespace
where
  nspname = 'public'
  and nspacl::text ~ E'[,\\{]+=U?C/'
;