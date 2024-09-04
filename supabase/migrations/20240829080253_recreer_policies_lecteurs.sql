CREATE POLICY "Allow select for authenticated users"
    ON public.lecteurs
    USING (
    auth.role() = 'authenticated'::text
    );

CREATE POLICY "Allow insert for authenticated users with role permissions"
    ON public.lecteurs
    WITH CHECK (
    auth.role() = 'authenticated'::text AND
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
    USING (
    auth.role() = 'authenticated'::text AND
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
    USING (
    auth.role() = 'authenticated'::text AND
    EXISTS (
        SELECT 1
        FROM public.user_roles ur
                 JOIN public.role_permissions rp
                      ON ur.role = rp.role
        WHERE ur.user_id = auth.uid()
          AND rp.permission = 'abonnes.delete'
    )
    );
