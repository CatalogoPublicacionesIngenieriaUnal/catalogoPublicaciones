
class Administrator::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :first_name, :last_name, :email])
    permit(:sign_in, keys: [:username, :password])
  end
end
