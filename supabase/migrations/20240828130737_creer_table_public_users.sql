create table public.users (
                              id          uuid default gen_random_uuid() primary key,
                              email       text unique not null,
                              password    text not null,
                              created_at  timestamp with time zone default now(),
                              updated_at  timestamp with time zone default now()
);
