drop table if exists public.users cascade;

create table public.users (
                              id                uuid primary key references auth.users(id) on delete cascade,
                              nom_utilisateur   text,
                              pays              text,
                              created_at        timestamp with time zone default now(),
                              updated_at        timestamp with time zone default now()
);