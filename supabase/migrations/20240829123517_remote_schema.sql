create table "public"."example" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."example" enable row level security;

CREATE UNIQUE INDEX example_pkey ON public.example USING btree (id);

alter table "public"."example" add constraint "example_pkey" PRIMARY KEY using index "example_pkey";

grant delete on table "public"."example" to "authenticated";

grant insert on table "public"."example" to "authenticated";

grant references on table "public"."example" to "authenticated";

grant select on table "public"."example" to "authenticated";

grant trigger on table "public"."example" to "authenticated";

grant truncate on table "public"."example" to "authenticated";

grant update on table "public"."example" to "authenticated";

grant delete on table "public"."example" to "service_role";

grant insert on table "public"."example" to "service_role";

grant references on table "public"."example" to "service_role";

grant select on table "public"."example" to "service_role";

grant trigger on table "public"."example" to "service_role";

grant truncate on table "public"."example" to "service_role";

grant update on table "public"."example" to "service_role";


