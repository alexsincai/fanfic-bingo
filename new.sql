drop table tropes;
create table tropes (
    id serial primary key,
    trope character varying(255),
    nsfw boolean
);

insert into tropes (trope, nsfw) values ('There was only one bed!', false);
insert into tropes (trope, nsfw) values ('Time travel', false);
insert into tropes (trope, nsfw) values ('Enemies to lovers', false);
insert into tropes (trope, nsfw) values ('Enemies to lovers to enemies', false);
insert into tropes (trope, nsfw) values ('Villain falls for hero', false);
insert into tropes (trope, nsfw) values ('Hanahaki disease', false);
insert into tropes (trope, nsfw) values ('Fuck or die', true);
insert into tropes (trope, nsfw) values ('Slow burn', false);
insert into tropes (trope, nsfw) values ('BDSM/kink', true);
insert into tropes (trope, nsfw) values ('Coffee shop AU', false);
insert into tropes (trope, nsfw) values ('College/Highschool AU', false);
insert into tropes (trope, nsfw) values ('Fairytale AU', false);
insert into tropes (trope, nsfw) values ('Zombie AU', false);
insert into tropes (trope, nsfw) values ('Body swap', false);
insert into tropes (trope, nsfw) values ('Domestic Fluff', false);
insert into tropes (trope, nsfw) values ('Crossover', false);
insert into tropes (trope, nsfw) values ('Kidnapped', false);
insert into tropes (trope, nsfw) values ('Characters wake up in a different show', false);
insert into tropes (trope, nsfw) values ('Love potion', false);
insert into tropes (trope, nsfw) values ('Fix-it', false);
insert into tropes (trope, nsfw) values ('5 times & 1 time', false);
insert into tropes (trope, nsfw) values ('Gender flip', false);
insert into tropes (trope, nsfw) values ('Annoying neighbor is actually hot', true);
insert into tropes (trope, nsfw) values ('Morning commute', false);
insert into tropes (trope, nsfw) values ('Fake dating', false);
insert into tropes (trope, nsfw) values ('Omegaverse', true);
insert into tropes (trope, nsfw) values ('Hurt/comfort', true);
insert into tropes (trope, nsfw) values ('Mpreg', true);
insert into tropes (trope, nsfw) values ('Murder mystery', false);
insert into tropes (trope, nsfw) values ('Kid fic', false);
insert into tropes (trope, nsfw) values ('Meet cute', false);
insert into tropes (trope, nsfw) values ('Flower Shop/Tattoo Salon AU', false);
insert into tropes (trope, nsfw) values ('Sex Pollen', true);
insert into tropes (trope, nsfw) values ('Amnesia', false);
insert into tropes (trope, nsfw) values ('Potterverse/Hogwarts', false);
insert into tropes (trope, nsfw) values ('College Professor/Student AU', false);
insert into tropes (trope, nsfw) values ('Angel/Demon AU (Good Omens AU)', false);
insert into tropes (trope, nsfw) values ('Hunger Games AU', false);
insert into tropes (trope, nsfw) values ('Fantasy AU (Lord of the Rings, Game of Thrones etc)', false);
insert into tropes (trope, nsfw) values ('Robot/Android (Westworld)', false);
insert into tropes (trope, nsfw) values ('Pride and prejudice AU', false);
insert into tropes (trope, nsfw) values ('Character wakes up with superpowers', false);
insert into tropes (trope, nsfw) values ('Meet ugly', false);
insert into tropes (trope, nsfw) values ('I hit you with my car', false);
insert into tropes (trope, nsfw) values ('We got into a fight at the checkout line', false);
insert into tropes (trope, nsfw) values ('Both at the ER for stupid injuries', false);
insert into tropes (trope, nsfw) values ('Cute doctor/nurse & patient AU', false);
insert into tropes (trope, nsfw) values ('Soulmates', false);

drop table cards;
create table cards (
    id serial primary key,
    string character varying(64),
    entries integer[]
);

drop table bingos;
create table bingos (
    id serial primary key,
    string character varying(7),
    fakeid character varying(7),
    entries integer[]
);

insert into cards (string, entries) values ('b28d25c', array[35, 24, 36, 14, 30, 21, 40, 23, 39, 28, 44, 2, 20, 48, 17, 8, 5, 4, 25, 11, 38, 3, 9, 34]);
insert into bingos (string, fakeid, entries) values('b28d25c', 'ca489e6', array[10, 11, 12, 13, 22]);
