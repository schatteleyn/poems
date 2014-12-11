class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_author_registration_path(resource)
  end

  def after_update_path_for(resource)
    new_text_path(resource)
  end
end
