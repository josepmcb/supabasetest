ALTER TABLE public.lecteurs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow select for authenticated users"
    ON public.lecteurs
    FOR SELECT
    TO authenticated
    USING (true);

CREATE POLICY "Allow insert for authenticated users with role permissions"
    ON public.lecteurs
    FOR INSERT
    TO authenticated
    WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.user_roles ur
                 JOIN public.role_permissions rp
                      ON ur.role = rp.role
        WHERE ur.user_id = auth.uid()
          AND rp.permission = 'abonnes.insert'
    )
    );

CREATE POLICY "Allow update for authenticated users with role permissions"
    ON public.lecteurs
    FOR UPDATE
    TO authenticated
    USING (
    EXISTS (
        SELECT 1
        FROM public.user_roles ur
                 JOIN public.role_permissions rp
                      ON ur.role = rp.role
        WHERE ur.user_id = auth.uid()
          AND rp.permission = 'abonnes.insert'
    )
    );

CREATE POLICY "Allow delete for authenticated users with role permissions"
    ON public.lecteurs
    FOR DELETE
    TO authenticated
    USING (
    EXISTS (
        SELECT 1
        FROM public.user_roles ur
                 JOIN public.role_permissions rp
                      ON ur.role = rp.role
        WHERE ur.user_id = auth.uid()
          AND rp.permission = 'abonnes.delete'
    )
    );
