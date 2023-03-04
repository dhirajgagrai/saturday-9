-- insert into movies and active_movies
insert into public.movies
  (name, img_url)
values
  ('Argo', 'https://upload.wikimedia.org/wikipedia/en/e/e1/Argo2012Poster.jpg'),
  ('The Shining', 'https://upload.wikimedia.org/wikipedia/en/1/1d/The_Shining_%281980%29_U.K._release_poster_-_The_tide_of_terror_that_swept_America_IS_HERE.jpg'),
  ('Goodfellas', 'https://upload.wikimedia.org/wikipedia/en/7/7b/Goodfellas.jpg');

with inserted_movies as (
    select id from public.movies
)
insert into public.active_movies
  (movie_id)
select * from inserted_movies;