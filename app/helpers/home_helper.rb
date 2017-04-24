module HomeHelper

 def resource_name
   :professor
   #:administrator
 end

 def resource_name_admin
   :administrator
 end

 def resource
   @resource ||= Professor.new
   #@resource ||= Administrator.new
 end

 def resource_admin
   @resource ||= Administrator.new
 end

 def devise_mapping
   #@devise_mapping ||= Devise.mappings[resource_name]
   @devise_mapping ||= Devise.mappings[:administrator]
 end

end
