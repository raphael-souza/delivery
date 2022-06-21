# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'raphael@pegaki.com', password: 'Teste123')

store = Store.create(name: 'Raphael', cpf: '10079100011', phone: '37999487508', user_id: User.last.id)
 
store.orders.create(
    description: 'pedido seed',
    recipient_name: 'João Pedro',
    paid_out: false,
    value: 88.99
  )
  puts('* Seed finalizado ')