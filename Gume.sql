drop database if exists gume;
create database gume character set utf8;
use gume;

create table artikl(
    sifra int not null primary key auto_increment,
    cijena decimal(18,3),
    vrsta varchar(30) not null,
    naziv varchar(50) not null
);

create table kupac(
    sifra int not null primary key auto_increment,
    ime varchar(30) not null,
    prezime varchar(30) not null,
    email varchar(30) not null,
    kontakt varchar(30) not null,
    termin int not null,
    adresa varchar(30) not null
);

create table artikl_termin(
    artikl int not null,
    termin int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,3)
);

create table termin(
    sifra int not null primary key auto_increment,
    usluga varchar(50) not null,
    kupac varchar(50) not null
);

create table usluga_termin(
    usluga int not null,
    termin int not null
);

alter table kupac add foreign key (termin) references termin(sifra);

alter table artikl_termin add foreign key (artikl) references artikl(sifra);
alter table artikl_termin add foreign key (termin) references termin(sifra);

alter table usluga_termin add foreign key (usluga) references usluga(sifra);
alter table usluga_termin add foreign key (termin) references termin(sifra);

select * from artikl;

insert into artikl(sifra,cijena,vrsta,naziv) values
(null,40,'Ratkapa','Toro'),
(null,50,'Ratkapa','Racing'),
(null,60,'Ratkapa','Agro'),
(null,100,'GumaZimska','Sava'),
(null,200,'GumaZimska','Michelin'),
(null,250,'GumaZimska','GoodYear');