create policy "Allow authorized read access"
    on public.example
    for select
    using ( (SELECT authorize('example.select')) );