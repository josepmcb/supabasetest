
DROP POLICY IF EXISTS "Enable insert for authenticated users only" ON public.example;

CREATE POLICY "Enable insert for authenticated and responsables only"
    ON public.example
    as permissive
    FOR SELECT
    to authenticated
    USING (
    EXISTS (
        SELECT 1
        FROM public.user_roles
        WHERE role = 'responsable'
    )
    );


