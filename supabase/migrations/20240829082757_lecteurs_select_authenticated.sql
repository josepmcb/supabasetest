create policy "Allow authenticated read access"
    on "public"."lecteurs"
    to public
    using (
    (auth.role() = 'authenticated'::text)
    );
