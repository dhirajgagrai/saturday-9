alter table "public"."active_movies" enable row level security;

alter table "public"."archived_movies" enable row level security;

alter table "public"."movies" enable row level security;

create policy "Enable read access for all users"
on "public"."active_movies"
as permissive
for select
to anon
using (true);


create policy "Enable read access for all users"
on "public"."movies"
as permissive
for select
to anon
using (true);



