module ControllerMacros
  def devise_set_mapping(class_name)
    request.env["devise.mapping"] = Devise.mappings[class_name.to_sym]
  end
end
