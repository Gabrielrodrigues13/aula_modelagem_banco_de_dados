Sobre o Projeto
Link do Repositorio no git https://github.com/Gabrielrodrigues13/aula_modelagem_banco_de_dados.git
Este arquivo SQL contém a estrutura e os dados iniciais do Banco de Dados Garou Arts, um sistema desenvolvido para gerenciar:

Clientes

Pedidos

Produtos

Materiais

Estoque

Itens de pedido

Pagamentos

Usuários

Etapas de produção

O banco foi criado com base em SQLite, utilizando SQLiteStudio para geração do dump.

🛠️ Tecnologias Utilizadas

SQLite 3

SQLiteStudio v3.4.17

SQL padrão (DDL + DML)

📂 Estrutura do Banco de Dados

O banco é composto por 9 tabelas principais, cada uma representando partes essenciais do fluxo de produção, vendas e gestão interna.

📌 1. cliente

Armazena dados dos clientes.

Campos principais:

id_cliente (PK)

nome

telefone

endereco

email

📌 2. pedido

Registra pedidos realizados pelos clientes.

Campos principais:

id_pedido (PK)

nome

data_entrega_prevista

data_pedido

quantidade

valor

id_cliente (FK → cliente)

📌 3. produto

Produtos associados a um pedido.

Campos principais:

id_produto (PK)

nome

quantidade

valor

id_pedido (FK → pedido)

📌 4. material

Materiais usados para produção dos produtos.

Campos principais:

id_material (PK)

nome

descricao

quantidade_estoque

tamanho

📌 5. estoque

Relaciona produtos e materiais com quantidades e valores unitários.

Campos principais:

id_estoque (PK)

quantidade

valor_unitario

id_produto (FK → produto)

id_material (FK → material)

📌 6. item_pedido

Itens individuais dentro de um pedido.

Campos principais:

id_item_pedido (PK)

quantidade

preco

id_pedido (FK → pedido)

id_produto (FK → produto)

⚠️ Observação: valores foram inseridos usando vírgula ('30,20'), o que pode gerar erro em FLOAT no SQLite.

📌 7. pagamento

Registra pagamentos realizados pelos clientes.

Campos principais:

id_pagamento (PK)

valor

data_pagamento

metodo

status

id_pedido (FK → pedido)

⚠️ Observação:

data_pagamento NOW está incorreto — NOW não é tipo válido no SQLite.

Valores também foram inseridos como strings com "R$".

📌 8. usuario

Funcionários do sistema.

Campos principais:

id_usuario (PK)

nome

email

senha_hash

perfil

📌 9. etapa_producao

Etapas que um pedido percorre durante a produção.

Campos principais:

id_etapa_producao (PK)

nome

descricao

id_usuario (FK → usuario)

id_pedido (FK → pedido)

🔗 Diagrama Entidade-Relacionamento (DER)

As principais relações do sistema:

cliente (1:N) pedido

pedido (1:N) produto

pedido (1:N) item_pedido

produto (1:N) item_pedido

produto (1:N) estoque

material (1:N) estoque

usuario (1:N) etapa_producao

pedido (1:N) etapa_producao

pedido (1:N) pagamento

Se desejar, posso incluir uma imagem do DER no README.

🧹 Problemas encontrados no arquivo SQL (com sugestões)
❗ 1. Valores monetários com “R$” e vírgulas

Exemplo:
'R$30,20' → isso quebra FLOAT.

Sugestão: usar 30.20.

❗ 2. Campo data_pagamento com tipo “NOW”

SQLite não possui este tipo.

Sugestão: TEXT, DATE ou DATETIME.

❗ 3. Muitos inserts com FKs NULL

Item_pedido e Pagamento possuem registros sem id_pedido.

❗ 4. Tabela usuario tem campo senha_hash sem tipo.
🚀 Como executar este banco
1. Instalar SQLite

https://www.sqlite.org/download.html

2. Abrir o terminal na pasta do arquivo
sqlite3 garou_arts.db

3. Carregar o script
.read 01_banco_de_dados_garou_arts.sql

📦 Exemplo de Consulta
Buscar todos os pedidos com seus clientes
SELECT p.id_pedido, p.nome, c.nome AS cliente
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente;

Estoque por produto
SELECT pr.nome, e.quantidade, e.valor_unitario
FROM estoque e
JOIN produto pr ON e.id_produto = pr.id_produto;

📝 Licença

Este banco de dados pode ser usado para fins acadêmicos, estudos e demonstrações.

🤝 Contribuições

Pull requests são bem-vindos.
Para grandes mudanças, abra uma issue primeiro para discutir suas ideias# aula_modelagem_banco_de_dados