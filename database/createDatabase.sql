create database mogu_web;
use mogu_web;

create table contest
(
    id       bigint auto_increment
        primary key,
    name     varchar(100) null,
    category varchar(100) null,
    end_date datetime(6)  null,
    img_url  varchar(255) null,
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


INSERT INTO contest (name, category, end_date, img_url, url) VALUES
('실감미디어 콘텐츠 제작 공모전', 'inha', '2024-01-15 03:12:20', './assets/img/img1.png', 'https://open.kakao.com/o/grzSiNTf'),
('ZEPETO WORLD JAM FALL 2023', 'game', '2023-11-25 03:28:56', './assets/img/img2.png', 'https://open.kakao.com/o/grzSiNTf'),
('인공지능윤리 아이디어 경진대회', 'AI', '2023-12-03 03:30:31', './assets/img/img4.png', 'https://open.kakao.com/o/grzSiNTf'),
('K-PaaS 아이디어 공모전', 'idea', '2023-12-13 03:31:12', './assets/img/img5.png', 'https://open.kakao.com/o/grzSiNTf'),
('엔지니어링산업 대국민 콘텐츠 공모전', 'contest', '2024-01-31 03:33:01', './assets/img/img6.png', 'https://open.kakao.com/o/grzSiNTf');

INSERT INTO roles (name) VALUES ('ROLE_ADMIN');
INSERT INTO roles (name) VALUES ('ROLE_DESIGNER');
INSERT INTO roles (name) VALUES ('ROLE_DEVELOPER');
INSERT INTO roles (name) VALUES ('ROLE_USER');
