-- Function to handle new user creation and insert role
CREATE OR REPLACE FUNCTION public.handle_new_user()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    SECURITY DEFINER
AS $$
BEGIN
    -- Insert into public.users
    INSERT INTO public.users (id, nom_utilisateur, pays, created_at, updated_at)
    VALUES (
               new.id,
               new.raw_user_meta_data ->> 'first_name',
               new.raw_user_meta_data ->> 'last_name',
               now(),
               now()
           );

    -- Insert into public.user_roles
    INSERT INTO public.user_roles (user_id, role)
    VALUES (
               new.id,
               'agent'
           );

    RETURN NEW;
END;
$$;

-- Create or replace the trigger for new user creation
CREATE OR REPLACE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
EXECUTE FUNCTION public.handle_new_user();