-- Eliminar la funció personalitzada
-- DROP FUNCTION IF EXISTS public.custom_access_token_hook;

-- Revocar permisos d'execució per a tots els rols
REVOKE EXECUTE ON FUNCTION public.custom_access_token_hook FROM supabase_auth_admin;
REVOKE EXECUTE ON FUNCTION public.custom_access_token_hook FROM authenticated;
REVOKE EXECUTE ON FUNCTION public.custom_access_token_hook FROM anon;
REVOKE EXECUTE ON FUNCTION public.custom_access_token_hook FROM public;

-- Revocar permisos sobre la taula user_roles
REVOKE ALL ON TABLE public.user_roles FROM supabase_auth_admin;
REVOKE ALL ON TABLE public.user_roles FROM authenticated;
REVOKE ALL ON TABLE public.user_roles FROM anon;
REVOKE ALL ON TABLE public.user_roles FROM public;

-- Eliminar la política creada
DROP POLICY IF EXISTS "Allow auth admin to read user roles" ON public.user_roles;
