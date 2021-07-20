
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
