create table "public"."active_movies" (
    "movie_id" integer,
    "votes" integer
);


alter table "public"."active_movies" add constraint "active_movies_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES movies(id) not valid;

alter table "public"."active_movies" validate constraint "active_movies_movie_id_fkey";


