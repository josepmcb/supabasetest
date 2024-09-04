create policy "Allow authorized select access"
on "public"."example"
as permissive
for select
to public
using (( SELECT authorize('abonnes.delete'::app_permission) AS authorize));



