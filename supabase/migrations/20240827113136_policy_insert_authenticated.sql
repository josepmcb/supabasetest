create policy "Enable insert for authenticated users only"
    on "public"."tickets"
    for insert to authenticated
    with check (true);