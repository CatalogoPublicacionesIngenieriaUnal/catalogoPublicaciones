module ControllerMacros
  def login_administrator
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:administrator]
      Administrator.destroy((Administrator.find_by username: "root").id)
      sign_in FactoryGirl.create(:administrator) # Using factory girl as an example
    end
  end

  def login_professor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:professor]
      Professor.destroy((Professor.find_by email: "ivdgonzalezco@unal.edu.co").id)
      user = FactoryGirl.create(:professor)
      sign_in user
    end
  end
end
