DROP POLICY IF EXISTS "Allow authenticated read access"
    ON public.tickets;

CREATE POLICY "Allow authenticated read access"
    ON public.tickets
    FOR SELECT
    TO authenticated
    USING (auth.role() = 'authenticated'::text);