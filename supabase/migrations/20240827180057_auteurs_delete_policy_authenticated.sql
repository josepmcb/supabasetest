CREATE POLICY "Enable delete for authenticated users only"
    ON "public"."auteurs"
    AS PERMISSIVE
    FOR DELETE
    TO authenticated
    USING (
    auth.uid() IS NOT NULL
    );