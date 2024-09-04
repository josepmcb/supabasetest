create policy "Allow authorized insert access authorised"
    on public.nova_taula
    for insert
    to authenticated
    with check (
    authorize('example.select')
    );
