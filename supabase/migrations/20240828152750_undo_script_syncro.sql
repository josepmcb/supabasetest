-- Eliminar triggers
DROP TRIGGER IF EXISTS on_user_insert ON auth.users;
DROP TRIGGER IF EXISTS on_user_update ON auth.users;
DROP TRIGGER IF EXISTS on_user_delete ON auth.users;

-- Eliminar funcions
DROP FUNCTION IF EXISTS sync_user_insert();
DROP FUNCTION IF EXISTS sync_user_update();
DROP FUNCTION IF EXISTS sync_user_delete();
