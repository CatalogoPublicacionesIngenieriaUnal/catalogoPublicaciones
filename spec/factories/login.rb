FactoryGirl.define do
  factory :professor do
    email 'ivdgonzalezco@unal.edu.co '
    password 'Collazos4598'
    first_name 'Ivan'
    last_name 'Gonzalez'
    username 'ivdgonzalezco'

    # if needed
    # is_active true
  end

  factory :administrator do
    username 'root'
    password '123456789'
    email 'ivdgonzalezco@unal.edu.co '
    first_name 'Ivan'
    last_name 'Gonzalez'
  end
end
