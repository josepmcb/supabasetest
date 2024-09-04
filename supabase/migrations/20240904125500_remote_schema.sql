drop policy "Allow authorized insert access" on "public"."nova_taula";

alter table "public"."auteurs" disable row level security;

create policy "Allow authorized read access"
on "public"."nova_taula"
as permissive
for select
to public
using (( SELECT authorize('example.select'::app_permission) AS authorize));



