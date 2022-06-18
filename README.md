# README

Projeto para simular o cadastro de usuários (entregadores e logistas) e pedidos para entrega de mercadorias.

Things you may want to cover:

* Ruby version 

* System dependencies

* Configuration

* Database creation

docker volume create volume_db_postgres
docker run -d -p 5432:5432 -v "volume_db_postgres:/var/lib/postgresql/data" -e POSTGRES_PASSWORD=admin123 -e PRIMARY_USER=postgres postgres

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* exibir qual processo na porta do postgresql: sudo ss -lptn 'sport = :5432'
* finalizar processo:  sudo kill PID
* iniciar servidor do sidekiq
  - bundle exec sidekiq
