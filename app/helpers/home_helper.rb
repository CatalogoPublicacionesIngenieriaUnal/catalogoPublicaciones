module HomeHelper

 def resource_name
   :professor
  #  :administrator
 end

 def resource
   @resource ||= Professor.new
  #  @resource ||= Administrator.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:professor]
  #  @devise_mapping ||= Devise.mappings[:administrator]
 end

end
