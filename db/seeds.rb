# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SEEDS PARA DESARROLLO
#Super Usuario
Administrator.create!(username: "root", email: "correofalso@unal.edu.co", first_name: "super", last_name: "usuario", password: "123456789",password_confirmation: "123456789")

Language.create!([{name: "Español"},{name: "Inglés"},{name: "Francés"},
  {name: "Alemán"},{name: "Ruso"}, {name: "Portugués"}])

Category.create!([{category: "Revista"},{category: "Produccion Editorial"},
  {category: "Antologia"},{category: "Articulo"}])

for i in 0..20
  Theme.create!(theme: Faker::Book.genre)
end


for i in 0..100
  Keyword.create(keyword: Faker::Job.field)
end

for i in 0..60
  Professor.create!(username: Faker::Internet.unique.user_name, first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, email: Faker::Internet.unique.email,
    contact_number: Faker::Number.number(10),is_authorized: Faker::Boolean.boolean(0.8),
    password: "123456", password_confirmation: "123456")
end


# for i in 0..20
#   publication = Publication.create!(title:Faker::Book.title, abstract: Faker::Lorem.paragraph,
#                 category_id: Faker::Number.between(1, 4), theme_id:Faker::Number.between(1, 20))
# end
