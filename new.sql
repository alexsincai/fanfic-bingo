drop table tropes;
create table tropes (
    id serial primary key,
    trope character varying(255),
    nsfw boolean default false
);

insert into tropes (trope) values ('There was only one bed!');
insert into tropes (trope) values ('Time travel');
insert into tropes (trope) values ('Enemies to lovers');
insert into tropes (trope) values ('Enemies to lovers to enemies');
insert into tropes (trope) values ('Villain falls for hero');
insert into tropes (trope) values ('Hanahaki disease');
insert into tropes (trope, nsfw) values ('Fuck or die', true);
insert into tropes (trope) values ('Slow burn');
insert into tropes (trope, nsfw) values ('BDSM/kink', true);
insert into tropes (trope) values ('Coffee shop AU');
insert into tropes (trope) values ('College/Highschool AU');
insert into tropes (trope) values ('Fairytale AU');
insert into tropes (trope) values ('Zombie AU');
insert into tropes (trope) values ('Body swap');
insert into tropes (trope) values ('Domestic Fluff');
insert into tropes (trope) values ('Crossover');
insert into tropes (trope) values ('Kidnapped');
insert into tropes (trope) values ('Characters wake up in a different show');
insert into tropes (trope) values ('Love potion');
insert into tropes (trope) values ('Fix-it');
insert into tropes (trope) values ('5 times & 1 time');
insert into tropes (trope) values ('Gender flip');
insert into tropes (trope, nsfw) values ('Annoying neighbor is actually hot', true);
insert into tropes (trope) values ('Morning commute');
insert into tropes (trope) values ('Fake dating');
insert into tropes (trope, nsfw) values ('Omegaverse', true);
insert into tropes (trope, nsfw) values ('Hurt/comfort', true);
insert into tropes (trope, nsfw) values ('Mpreg', true);
insert into tropes (trope) values ('Murder mystery');
insert into tropes (trope) values ('Kid fic');
insert into tropes (trope) values ('Meet cute');
insert into tropes (trope) values ('Flower Shop/Tattoo Salon AU');
insert into tropes (trope, nsfw) values ('Sex Pollen', true);
insert into tropes (trope) values ('Amnesia');
insert into tropes (trope) values ('Potterverse/Hogwarts');
insert into tropes (trope) values ('College Professor/Student AU');
insert into tropes (trope) values ('Angel/Demon AU (Good Omens AU)');
insert into tropes (trope) values ('Hunger Games AU');
insert into tropes (trope) values ('Fantasy AU (Lord of the Rings, Game of Thrones etc)');
insert into tropes (trope) values ('Robot/Android (Westworld)');
insert into tropes (trope) values ('Pride and prejudice AU');
insert into tropes (trope) values ('Character wakes up with superpowers');
insert into tropes (trope) values ('Meet ugly');
insert into tropes (trope) values ('I hit you with my car');
insert into tropes (trope) values ('We got into a fight at the checkout line');
insert into tropes (trope) values ('Both at the ER for stupid injuries');
insert into tropes (trope) values ('Cute doctor/nurse & patient AU');
insert into tropes (trope) values ('Soulmates');
insert into tropes (trope) values ('Proposal');

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
