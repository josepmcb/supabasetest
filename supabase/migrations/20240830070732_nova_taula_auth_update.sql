create policy "Allow authorized update access"
    on public.nova_taula
    for update
    using ( (SELECT authorize('example.select')) ); -- Seulement pour les responsables