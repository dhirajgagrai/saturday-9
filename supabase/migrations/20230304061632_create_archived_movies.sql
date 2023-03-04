create table "public"."archived_movies" (
    "movie_id" integer,
    "archived_date" date not null default CURRENT_DATE
);


alter table "public"."archived_movies" add constraint "archived_movies_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES movies(id) not valid;

alter table "public"."archived_movies" validate constraint "archived_movies_movie_id_fkey";


