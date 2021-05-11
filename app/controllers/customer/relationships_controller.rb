class Customer::RelationshipsController < ApplicationController
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :birth_date, :gender, :profile_image, :introduction])
  end
end
