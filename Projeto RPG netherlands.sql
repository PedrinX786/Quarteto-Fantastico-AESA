create DATABASE netherlands;

USE netherlands;
create table jogador (
id_jogador integer,
nome_jogador varchar(40),
data_de_nascimento date,
email varchar(40),
primary key(id_jogador)
)

create table conta (
id_conta integer,
senha_conta varchar(30),
id_jogador integer,
primary key(id_conta),
foreign key(id_jogador) references jogador(id_jogador)
)

create table raca (
id_raca integer,
nome_raca varchar (15),
dest_arma_long_dist varchar (5),
magia varchar(5),
dest_arma_pesada varchar(5),
dest_arma_leve varchar(5),
inteligencia varchar(5),
forca varchar(5),
velocidade varchar(5),
primary key(id_raca)
)

create table personagem (
id_personagem integer,
id_conta integer,
nome_personagem varchar(25),
genero_personagem varchar(15),
nivel_personagem integer,
id_raca integer,
primary key(id_personagem),
foreign key (id_conta) references conta(id_conta),
foreign key (id_raca) references raca(id_raca)
)

create table itens (
id_item integer,
nome_item varchar(40),
tipo_item varchar(30),
raridade_item varchar(20),
primary key(id_item)
)

create table inventario (
id_inventario integer,
id_personagem integer,
id_item integer,
quantidade_itens integer,
primary key(id_inventario),
foreign key (id_item) references itens (id_item),
foreign key (id_personagem) references personagem (id_personagem)
)

create table torneio (
id_torneio integer,
nome_torneio varchar(40),
data_inicial date,
data_final date,
premio_torneio varchar(60),
primary key(id_torneio)
)

create table missao (
id_missao integer,
id_personagem integer,
titulo varchar(60),
nivel_minimo integer,
recompensa varchar(80),
primary key(id_missao),
foreign key (id_personagem) references personagem (id_personagem)
)

create table guilda(
id_guilda integer,
id_lider integer,
data_criacao date,
nome_guilda varchar(40),
primary key(id_guilda),
foreign key(id_lider) references jogador(id_jogador)
)

create table chat (
id_chat integer,
id_guilda integer,
id_jogador integer,
mensagem varchar(100),
data_envio date,
primary key (id_chat),
foreign key(id_guilda) references guilda(id_guilda),
foreign key(id_jogador) references jogador(id_jogador)
)



insert into jogador
(id_jogador, nome_jogador, data_de_nascimento, email)
values
(1, 'Marcos', '2007-07-02', 'mar@gmail.com'),
(2, 'Mateus', '2005-03-08', 'mat@gmail.com'),
(3, 'Lucas', '2006-08-03', 'luc@gmail.com'),
(4, 'João', '2003-04-09', 'joao@gmail.com');

insert into conta
(id_conta, senha_conta, id_jogador)
values
(1, 'xxxxxx', 2),
(2, 'xxxxxy', 3),
(3, 'xxxxyx', 4),
(4, 'xxxyxx', 1);

insert into raca
(id_raca, nome_raca, dest_arma_long_dist, magia, dest_arma_pesada, dest_arma_leve, inteligencia, forca, velocidade)
values
(1, 'humano', '6/10', '9/10', '3/10', '8/10', '10/10', '5/10', '6/10'),
(2, 'orc', '2/10', '1/10', '10/10', '6/10', '5/10', '10/10', '4/10'),
(3, 'centauro', '9/10', '3/10', '4/10', '8/10', '9/10', '6/10', '10/10'),
(4, 'elfo', '10/10', '8/10', '2/10', '10/10', '10/10', '4/10', '7/10'),
(5, 'goblin', '6/10', '7/10', '1/10', '10/10', '6/10', '3/10', '7/10'),
(6, 'anão', '5/10', '3/10', '6/10', '6/10', '9/10', '6/10', '3/10');

insert into personagem
(id_personagem, id_conta, nome_personagem, genero_personagem, nivel_personagem, id_raca)
values
(1, 4, 'geun', 'masculino', 11, 1),
(2, 1, 'testosterona_barbara', 'trans', 100, 2),
(3, 2, 'giganteLeo', 'masculino', 50, 6),
(4, 3, 'lonoVirus', 'feminino', 83, 4);

insert into itens
(id_item, nome_item, tipo_item, raridade_item)
values
(1, 'pão', 'alimento', 'comum'),
(2, 'fire resistence', 'poção', 'incomum'),
(3, 'capa de invisibilidade', 'acessório', 'raro'),
(4, 'rubi vermelho', 'material', 'limitado'),
(5, 'picareta macaco', 'ferramenta', 'lendária'),
(6, 'escalibur', 'arma', 'mítico');

insert into inventario
(id_inventario, id_personagem, id_item, quantidade_itens)
values
(1, 2, 5, 1),
(2, 1, 1, 6),
(3, 3, 2, 2),
(4, 4, 3, 1);

insert into torneio
(id_torneio, nome_torneio, data_inicial, data_final, premio_torneio)
values
(1, 'champions league', '2025-10-11', '2025-10-15', '10000000'),
(2, 'reborned', '2025-10-09', '2025-10-10', '1000000'),
(3, 'out of blood', '2025-11-20', '2025-11-29', 'caveira do dragão'),
(4, 'league challenge', '2025-11-13', '2025-11-19', 'espada macaco');

insert into missao
(id_missao, id_personagem, titulo, nivel_minimo, recompensa)
values
(1, 1, 'derrote javali rei', 10, '100/8XP'),
(2, 2, 'saquear dungeon', 50, 'rubi vermelho/560XP'),
(3, 3, 'queimar vilas inimigas', 50, 'rubi azul/440XP'),
(4, 4, 'salvar princesa', 62, 'arco elfico do rei/710XP');

insert into guilda
(id_guilda, id_lider, data_criacao, nome_guilda)
values
(1, 2, '2024-08-10', 'los dragons'),
(2, 4, '2025-02-11', 'ballas');

insert into chat
(id_chat, id_guilda, id_jogador, mensagem, data_envio)
values
(1, 1, 2, 'bora x1', '2024-09-11'),
(2, 1, 3, 'aceitokk', '2024-09-11');