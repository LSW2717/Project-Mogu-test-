create database mogu_web;
use mogu_web;

create table contest
(
    end_date datetime(6)  null,
    id       bigint auto_increment
        primary key,
    category varchar(100) null,
    name     varchar(100) null,
    url      varchar(255) null
);

create table contest_seq
(
    next_val bigint null
);

create table refreshtoken_seq
(
    next_val bigint null
);

create table roles
(
    id   int auto_increment
        primary key,
    name enum ('ROLE_ADMIN', 'ROLE_DESIGNER', 'ROLE_DEVELOPER', 'ROLE_USER') null
);

create table user
(
    id             bigint auto_increment
        primary key,
    login_id       varchar(50)  null,
    email          varchar(100) null,
    name           varchar(100) null,
    login_password varchar(255) null,
    constraint UK6ntlp6n5ltjg6hhxl66jj5u0l
        unique (login_id),
    constraint UKob8kqyqqgmefl0aco34akdtpe
        unique (email)
);

create table refreshtoken
(
    expiry_date datetime(6)  not null,
    id          bigint       not null
        primary key,
    user_id     bigint       null,
    token       varchar(255) not null,
    constraint UK_81otwtvdhcw7y3ipoijtlb1g3
        unique (user_id),
    constraint UK_or156wbneyk8noo4jstv55ii3
        unique (token),
    constraint FKfr75ge3iecdx26qe8afh1srf6
        foreign key (user_id) references user (id)
);

create table user_roles
(
    role_id int    not null,
    user_id bigint not null,
    primary key (role_id, user_id),
    constraint FK55itppkw3i07do3h7qoclqd4k
        foreign key (user_id) references user (id),
    constraint FKh8ciramu9cc9q3qcqiv4ue8a6
        foreign key (role_id) references roles (id)
);

create table user_seq
(
    next_val bigint null
);

