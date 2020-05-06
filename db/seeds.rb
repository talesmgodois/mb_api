# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seedInvoices
  Invoice.destroy_all()

  Invoice.create!([
    {code: 1, description:'Teste'},
    {code: 2, description:'Teste'},
    {code: 3, description:'Teste'},
    {code: 4, description:'Teste'}
  ])
end


def seedPerson()
  Person.destroy_all()

  Person.create!([
    {first_name:"Tales", last_name:"marinho", age: 29},
    {first_name:"TBert", last_name:"Bert", age: 17},
    {first_name:"Joey", last_name:"Triniany", age: 23}
  ])
end


# seedInvoices()
seedPerson()