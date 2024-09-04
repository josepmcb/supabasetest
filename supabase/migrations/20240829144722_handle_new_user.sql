-- Function to handle new user creation
CREATE OR REPLACE FUNCTION public.handle_new_user()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    SECURITY DEFINER
AS $$
BEGIN
    INSERT INTO public.users (id, nom_utilisateur, pays, created_at, updated_at)
    VALUES (
               new.id,
               new.raw_user_meta_data ->> 'first_name',
               new.raw_user_meta_data ->> 'last_name',
               now(),
               now()
           );
    RETURN NEW;
END;
$$;

-- Create or replace the trigger for new user creation
CREATE OR REPLACE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
EXECUTE FUNCTION public.handle_new_user();