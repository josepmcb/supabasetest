CREATE POLICY "Allow authenticated read access"
    ON public.auteurs
    FOR SELECT
    USING (
    auth.role() = 'authenticated'
    );