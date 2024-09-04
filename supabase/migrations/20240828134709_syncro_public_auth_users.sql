-- Functions
create or replace function sync_user_insert()
    returns trigger as $$
begin
    insert into public.users (id)
    values (new.id);
    return new;
end;
$$ language plpgsql;

create or replace function sync_user_update()
    returns trigger as $$
begin
    update public.users
    set updated_at = now()
    where id = new.id;
    return new;
end;
$$ language plpgsql;

create or replace function sync_user_delete()
    returns trigger as $$
begin
    delete from public.users
    where id = old.id;
    return old;
end;
$$ language plpgsql;


-- Triggers
create trigger on_user_insert
    after insert on auth.users
    for each row execute function sync_user_insert();

create trigger on_user_update
    after update on auth.users
    for each row execute function sync_user_update();

create trigger on_user_delete
    after delete on auth.users
    for each row execute function sync_user_delete();