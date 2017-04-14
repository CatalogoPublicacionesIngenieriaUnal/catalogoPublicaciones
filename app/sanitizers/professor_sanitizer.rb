
class Professor::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_in, keys: [:username])
  end
end
