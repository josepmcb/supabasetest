create policy "Enable read access for all users"
on "public"."example"
as permissive
for select
to public
using (true);



