create table "public"."nova_taula" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."nova_taula" enable row level security;

CREATE UNIQUE INDEX nova_taula_pkey ON public.nova_taula USING btree (id);

alter table "public"."nova_taula" add constraint "nova_taula_pkey" PRIMARY KEY using index "nova_taula_pkey";

grant delete on table "public"."nova_taula" to "authenticated";

grant insert on table "public"."nova_taula" to "authenticated";

grant references on table "public"."nova_taula" to "authenticated";

grant select on table "public"."nova_taula" to "authenticated";

grant trigger on table "public"."nova_taula" to "authenticated";

grant truncate on table "public"."nova_taula" to "authenticated";

grant update on table "public"."nova_taula" to "authenticated";

grant delete on table "public"."nova_taula" to "service_role";

grant insert on table "public"."nova_taula" to "service_role";

grant references on table "public"."nova_taula" to "service_role";

grant select on table "public"."nova_taula" to "service_role";

grant trigger on table "public"."nova_taula" to "service_role";

grant truncate on table "public"."nova_taula" to "service_role";

grant update on table "public"."nova_taula" to "service_role";


