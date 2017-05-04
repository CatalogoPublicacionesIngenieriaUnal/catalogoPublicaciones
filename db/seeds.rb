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

Criterium.create!([{criterion_type: :general, criterion: "El material constituye un aporte válido,"\
    "vigente y relevante para el área de conocimiento en la cual se inscribe"},
  {criterion_type: :general, criterion: "El material es resultado de un proceso maduro de"\
    "investigación o reflexión: su contenido es producto de un desarrollo conceptual"\
    "completo y del contraste crítico con otras investigaciones afines"},
  {criterion_type: :general, criterion: "Está debidamente estructurado y argumentado"\
    "(planteamiento del problema, metodología y resultados) en relación con las"\
    "prácticas de la disciplina a la que pertenece"},
  {criterion_type: :general, criterion: "La originalidad de los aportes y reflexiones del"\
    "autor le confieren un valor agregado al material"},
  {criterion_type: :general, criterion: "Las referencias bibliográficas cumplen con la exactitud, "\
    "pertinencia y actualidad requeridas"},
  {criterion_type: :general, criterion: "EI texto reúne las condiciones para ser parte de la"\
    "bibliografía más reconocida y necesaria sobre el tema"},
  {criterion_type: :writing, criterion: "Es adecuado el título de la obra"},
  {criterion_type: :writing, criterion:"La escritura presenta las calidades esperadas para"\
    "el nivel de formación (apropiada redacción, léxico, ortografía, claridad"\
    "conceptual, etc.)"},
  {criterion_type: :writing, criterion:"El material gráfico que acompaña los textos (imágenes "\
    "de toda índole y tablas) es relevante, clarifica y añade valor en todos los casos"},
  {criterion_type: :writing, criterion:"El texto presenta una introducción clara y precisa"\
    "sobre los objetivos y problemas que se abordan en el documento"},
  {criterion_type: :writing, criterion:"La extensión del texto es adecuada en función de"\
    "la complejidad del tema, los objetivos y el público lector" }])

for i in 0..50
  Professor.create!(username: Faker::Internet.unique.user_name, first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, email: Faker::Internet.unique.email,
    contact_number: Faker::Number.number(10),is_authorized: Faker::Boolean.boolean(0.8),
    password: "123456", password_confirmation: "123456")
end

#Publicaciones
##En Espera

for i in 0..20
  professor = Professor.find( Faker::Number.between(1, 51))

  application_requests = ApplicationRequest.create!(state: :'En espera', professor_id: professor.id)

  publication = Publication.create!(title:Faker::Book.title, abstract: Faker::Lorem.paragraph,
  category_id: Faker::Number.between(1, 4), theme_id:Faker::Number.between(1, 20),
  application_request_id: application_requests.id)

  ProfessorApplicationRequest.create!(publication_id: publication.id,
  professor_id: professor.id)

  for i in 0..Faker::Number.between(0, 5)
    ProfessorApplicationRequest.create!(publication_id: publication.id,
    professor_id: Professor.find( Faker::Number.between(1, 51)))
  end
end
