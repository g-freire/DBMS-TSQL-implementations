create table movie
(
  movie_id int identity not null primary key,
  name varchar(50)
);

insert into movie values('Batman'), ('Test');

create table category
(
  category_id int identity not null primary key,
  name varchar(50)
);

insert into category values('Sci-Fi'), ('Comedy');


create table movie_category_junction
(
  movie_id int,
  category_id int,
  CONSTRAINT movie_cat_pk PRIMARY KEY (movie_id, category_id),
  CONSTRAINT FK_movie FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES category (category_id)
);

insert into movie_category_junction
values (1, 1), (2, 2);



select m.name MovieName,
  c.name CategoryName
from movie m
left join movie_category_junction mc
  on m.movie_id = mc.movie_id
left join category c
  on mc.category_id = c.category_id

  select * from category
  select * from movie
