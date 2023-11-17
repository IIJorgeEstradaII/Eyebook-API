# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
     def new
       super
     end

    # POST /resource/sign_in
    def create
      super do
        if resource.persisted?
          render json: { user: resource, token: request.env['warden-jwt_auth.token'] }
          return
        end
      end
    end

    # DELETE /resource/sign_out
     def destroy
      super do
        render json: { message: 'Logout successful' }
      end
     end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
     def configure_sign_in_params
       devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
     end
  end
end
