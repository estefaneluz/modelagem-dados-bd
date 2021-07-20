
CREATE DATABASE ecommerce;

CREATE TABLE categorias (
  id serial PRIMARY KEY,
  nome varchar(50) NOT NULL
);

CREATE TABLE produtos (
  id serial PRIMARY KEY,
  nome varchar(100) NOT NULL,
  descricao text,
  preco int NOT NULL,
  quantidade_em_estoque int,
  categoria_id int REFERENCES categorias(id)
);


CREATE TABLE clientes (
  cpf char(11) UNIQUE PRIMARY KEY,
  nome varchar(150) NOT NULL
);
  
CREATE TABLE vendedores (
  cpf char(11) UNIQUE PRIMARY KEY,
  nome varchar(150) NOT NULL
);

CREATE TABLE pedidos (
  id serial PRIMARY KEY, 
  valor int NOT NULL,
  cliente_cpf char(11) REFERENCES clientes(cpf) NOT NULL,
  vendedor_cpf char(11) REFERENCES vendedores(cpf) NOT NULL
);
 
CREATE TABLE itens_do_pedido (
  id serial PRIMARY KEY,
  pedido_id int NOT NULL REFERENCES pedidos(id),
  quantidade int NOT NULL,
  produto_id int NOT NULL REFERENCES produtos(id)
);

INSERT INTO categorias(nome) VALUES 
  ('frutas'),
  ('verduras'),
  ('massas'),
  ('bebidas'),
  ('utilidades');

INSERT INTO produtos(nome, descricao, preco, quantidade_em_estoque, categoria_id)
VALUES 
  ('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1),
  ('Maça', 'Fonte de potássio e fibras.', 90, 34, 1),
  ('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
  ('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
  ('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
  ('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
  ('Maccarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
  ('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
  ('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
  ('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
  ('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
  ('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
  ('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
  ('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
  ('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
  ('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
  ('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
  ('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1)
