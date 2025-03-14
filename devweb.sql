CREATE TABLE "usuarios" (
  "id_usuario" varchar PRIMARY KEY,
  "nome_completo" varchar NOT NULL,
  "email" varchar NOT NULL,
  "telefone" varchar NOT NULL
);

CREATE TABLE "autores" (
  "id_autor" varchar PRIMARY KEY,
  "nome" varchar NOT NULL,
  "nacionalidade" varchar
);

CREATE TABLE "livros" (
  "id_livro" varchar PRIMARY KEY,
  "titulo" varchar NOT NULL,
  "ano" integer NOT NULL,
  "edicao" integer NOT NULL,
  "editora" varchar NOT NULL,
  "fk_autor" varchar NOT NULL
);

CREATE TABLE "emprestimos" (
  "id_emprestimo" varchar PRIMARY KEY,
  "data_emprestimo" date NOT NULL,
  "data_devol_prevista" date,
  "data_devol_efetiva" date,
  "valor_multa" float,
  "fk_usuario" varchar NOT NULL
);

CREATE TABLE "livros_emprestimos" (
  "fk_livro" varchar NOT NULL,
  "fk_emprestimo" varchar NOT NULL
);

ALTER TABLE "livros" ADD FOREIGN KEY ("fk_autor") REFERENCES "autores" ("id_autor");

ALTER TABLE "emprestimos" ADD FOREIGN KEY ("fk_usuario") REFERENCES "usuarios" ("id_usuario");

ALTER TABLE "livros_emprestimos" ADD FOREIGN KEY ("fk_livro") REFERENCES "livros" ("id_livro");

ALTER TABLE "livros_emprestimos" ADD FOREIGN KEY ("fk_emprestimo") REFERENCES "emprestimos" ("id_emprestimo");
