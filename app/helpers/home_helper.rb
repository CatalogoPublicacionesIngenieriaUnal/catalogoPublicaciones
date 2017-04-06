module HomeHelper
 def resource_name
   :professor
 end

 def resource
   @resource ||= Professor.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:professor]
 end


end
