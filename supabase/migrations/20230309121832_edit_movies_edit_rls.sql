drop policy "Enable read access for all users" on "public"."active_movies";

drop policy "Enable read access for all users" on "public"."movies";

create policy "Enable read access for all users"
on "public"."active_movies"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."movies"
as permissive
for select
to public
using (true);



