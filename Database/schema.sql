create database agenda_cultural;
use agenda_cultural;

create table usuarios (
    id_usuario int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    senha varchar(255) not null,
    tipo ENUM('administrador', 'curador', 'organizador') not null
);

create table categorias (
    id_categoria int auto_increment primary key,
    nome varchar(100) not null unique,
    descricao text not null
);

create table eventos (
    id_evento int auto_increment primary key,
    nome varchar(100) not null,
    descricao text not null,
    data_inicio datetime not null,
    data_fim datetime not null,
    localizacao varchar(255) not null,
    status_evento ENUM('pendente', 'aprovado', 'reprovado') not null default 'pendente',
    id_categoria int not null,
    id_organizador int not null,
    foreign key (id_categoria) references categorias(id_categoria),
    foreign key (id_organizador) references usuarios(id_usuario)
);
