create policy "Allow authorized delete access"
    on public.nova_taula
    for delete
    using ( (SELECT authorize('example.select')) ); -- Seulement pour les responsables