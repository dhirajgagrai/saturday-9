create table "public"."movies" (
    "id" integer generated always as identity not null,
    "name" text,
    "img_url" text
);


CREATE UNIQUE INDEX movies_pkey ON public.movies USING btree (id);

alter table "public"."movies" add constraint "movies_pkey" PRIMARY KEY using index "movies_pkey";


