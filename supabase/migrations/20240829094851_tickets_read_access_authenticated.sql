create policy "Allow authenticated read access"
    on "public"."tickets"
    to public
    using (
    (auth.role() = 'authenticated'::text)
    );
