create table "public"."user_votes" (
    "user_id" uuid not null,
    "voted_movie" integer
);


alter table "public"."user_votes" enable row level security;

CREATE UNIQUE INDEX user_votes_pkey ON public.user_votes USING btree (user_id);

alter table "public"."user_votes" add constraint "user_votes_pkey" PRIMARY KEY using index "user_votes_pkey";

alter table "public"."user_votes" add constraint "user_votes_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."user_votes" validate constraint "user_votes_user_id_fkey";

alter table "public"."user_votes" add constraint "user_votes_voted_movie_fkey" FOREIGN KEY (voted_movie) REFERENCES movies(id) not valid;

alter table "public"."user_votes" validate constraint "user_votes_voted_movie_fkey";

create policy "Enable insert for users based on user_id"
on "public"."user_votes"
as permissive
for insert
to authenticated
with check ((auth.uid() = user_id));


create policy "Enable read access for all users"
on "public"."user_votes"
as permissive
for select
to authenticated
using (true);


create policy "Enable update for users based on user_id"
on "public"."user_votes"
as permissive
for update
to authenticated
using ((auth.uid() = user_id))
with check ((auth.uid() = user_id));



