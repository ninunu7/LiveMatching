# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  #  #def new
  #    #super
  #  #end

  # # POST /resource/sign_in
  #  # def create
  #  #   super
  #  #   flash[:alert] = "退会済みです。"
  #  # end

  # # DELETE /resource/sign_out
  # # def destroy
  # #   super
  # # end

  #   protected
  #   def configure_sign_in_params
  #    # めーるアドレスが無い場合

  #    if params[:customer][:email].blank? || params[:customer][:password].blank?
  #     flash[:error] = "ログインに失敗しました。"
  #     redirect_to new_customer_session_path
  #     return
  #    end
  #     @customer = Customer.find_by(email: params[:customer][:email])
  #     #flash[:error] = "ログインに失敗しました。"
  #  #   #redirect_to new_customer_session_path
  #  #   return if @customer.nil?

  #  #  # if @customer.nil?
  #  #  #   return
  #  #  # end

  #     if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
  #       flash[:error] = "退会済みです。"
  #       redirect_to new_customer_session_path
  #     end
  #   end

  # # If you have extra params to permit, append them to the sanitizer.
  # # def configure_sign_in_params
  # #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # # end
end
