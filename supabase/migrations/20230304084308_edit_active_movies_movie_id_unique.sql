CREATE UNIQUE INDEX active_movies_movie_id_key ON public.active_movies USING btree (movie_id);

alter table "public"."active_movies" add constraint "active_movies_movie_id_key" UNIQUE using index "active_movies_movie_id_key";


