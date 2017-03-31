# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Profesores

for i in 0..60
  Professor.create!(user: Faker::Internet.unique.user_name, name: Faker::Name.first_name,
    lastname: Faker::Name.last_name, departament: Faker::Commerce.department(1),
    email: Faker::Internet.unique.email, created_at: Date.today,
    validated: Faker::Boolean.boolean(0.8))
end

#Estados
State.create!(name: "En espera de aprobacion", verifier: true)
State.create!(name: "En espera de evaluacion", verifier: true)
State.create!(name: "Aceptado", verifier: false)
State.create!(name: "Rechazado", verifier: false)
State.create!(name: "Aceptado con modificaciones", verifier: false)

Language.create!([{name: "Español"},{name: "ingles"},{name: "frances"}]);


for i in 0..20
  Judge.create!(user: Faker::Internet.unique.user_name, name: Faker::Name.first_name,
    lastname: Faker::Name.last_name, password: Faker::Internet.password, telephone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email, created_at: Date.today, language_id: Faker::Number.between(1, 3))
end


#application_requests
#en aprobacion
for i in 0..12
  aplication = ApplicationRequest.create!(created_at: Date.today, state_id: 1)
  publication = Publication.create!(abstract: Faker::Lorem.paragraph, theme:Faker::Book.title,
                category: Faker::Book.genre, application_request_id: aplication.id)

  for j in 0..Faker::Number.between(1, 10)
    Keyword.create!(keyword: Faker::RockBand.name, publication_id: publication.id)
  end

  for j in 0..2
    Attachment.create!(url: Faker::File.file_name, category: "tipo #{j}", application_request_id: aplication.id)
  end

  for j in 0..Faker::Number.between(1, 5)
    x = Faker::Number.between(1, 60)
    ProfessorPublication.create!(professor_id: x, publication_id: publication.id)
    ProfessorApplicationRequest.create!(professor_id: x, application_request_id: aplication.id)
  end
end

#Evaluada
for i in 0..30
  aplication = ApplicationRequest.create!(created_at: Date.today, state_id: 2)
  publication = Publication.create!(abstract: Faker::Lorem.paragraph, theme:Faker::Book.title,
                category: Faker::Book.genre, application_request_id: aplication.id)

  for j in 0..Faker::Number.between(1, 10)
      Keyword.create!(keyword: Faker::RockBand.name, publication_id: publication.id)
    end

  for j in 0..3
    Attachment.create!(url: Faker::File.file_name, category: "tipo #{j}", application_request_id: aplication.id)
  end

  for j in 0..Faker::Number.between(1, 5)
    x = Faker::Number.between(1, 60)
    ProfessorPublication.create!(professor_id: x, publication_id: publication.id)
    ProfessorApplicationRequest.create!(professor_id: x, application_request_id: aplication.id)
  end

  Evaluation.create!(justification: Faker::HarryPotter.quote, assigned_at: Date.today,
            judge_id: Faker::Number.between(1, 20), state_id: Faker::Number.between(3, 5),
            application_request_id: aplication.id)

end

#en evaluacion
for i in 0..10
  aplication = ApplicationRequest.create!(created_at: Date.today, state_id: 2)
  publication = Publication.create!(abstract: Faker::Lorem.paragraph, theme:Faker::Book.title,
                category: Faker::Book.genre, application_request_id: aplication.id)

  for j in 0..Faker::Number.between(1, 10)
    Keyword.create!(keyword: Faker::RockBand.name, publication_id: publication.id)
  end

  for j in 0..2
    Attachment.create!(url: Faker::File.file_name, category: "tipo #{j}", application_request_id: aplication.id)
  end

  for j in 0..Faker::Number.between(1, 5)
    x = Faker::Number.between(1, 60)
    ProfessorPublication.create!(professor_id: x, publication_id: publication.id)
    ProfessorApplicationRequest.create!(professor_id: x, application_request_id: aplication.id)
  end

  Evaluation.create!(assigned_at: Date.today, judge_id: Faker::Number.between(1, 20), state_id: Faker::Number.between(3, 5),
            application_request_id: aplication.id)

end


#Aprobada

for i in 0..12
  aplication = ApplicationRequest.create!(created_at: Date.today, state_id: 1)
  publication = Publication.create!(abstract: Faker::Lorem.paragraph, theme:Faker::Book.title,
                category: Faker::Book.genre, application_request_id: aplication.id)

  for j in 0..Faker::Number.between(1, 10)
    Keyword.create!(keyword: Faker::RockBand.name, publication_id: publication.id)
  end

  ApprovedPublication.create!(resolution: "Resolucion prueba", stock: Faker::Number.between(200, 500),
  stock_at_store: Faker::Number.between(100, 300), stock_at_library: Faker::Number.between(10, 200), publication_id: publication.id)

  for j in 0..2
    Attachment.create!(url: Faker::File.file_name, category: "tipo #{j}", application_request_id: aplication.id)
  end

  for j in 0..Faker::Number.between(1, 5)
    x = Faker::Number.between(1, 60)
    ProfessorPublication.create!(professor_id: x, publication_id: publication.id)
    ProfessorApplicationRequest.create!(professor_id: x, application_request_id: aplication.id)
  end


end
