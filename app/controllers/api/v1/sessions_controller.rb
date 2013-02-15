module Api
	module V1
		class SessionsController < ActionController::Base
		  prepend_before_filter :get_auth_token
		  before_filter :authenticate_user!, only: [:destroy]
		  before_filter :ensure_params_exist, only: [:create]
		 
		  respond_to :json
		  
		  def create
		    user = User.find_for_database_authentication(email: params[:credentials][:email])
		    if user and user.valid_password?(params[:credentials][:password])
		 	  sign_in user
		 	  user.reset_authentication_token!
		      render json: {success: true, auth_token: user.authentication_token, current_user: user}
		    else
		      render json: {success: false, message: "Error with your login or password"}, status: 401
		    end
		  end
		  
		  def destroy
		  	debugger
		  	@user = User.find_by_authentication_token(params[:auth_token])
		  	sign_out(@user)
		  	@user.authentication_token = nil
		  	@user.save
		  	render json: @user
		  end
		 
		  protected
		  def ensure_params_exist
		    return unless params[:credentials].blank?
		    render :json=>{:success=>false, :message=>"missing user_login parameter"}, status: 422
		  end
		 
		  def invalid_login_attempt
		    warden.custom_failure!
		    render :json=> {:success=>false, :message=>"Error with your login or password"}, status: 401
		  end

		  def get_auth_token
		  	params[:auth_token] = request.headers["Auth_token"]
		  end
		  
		end
	end
end