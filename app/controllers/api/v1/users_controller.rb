module Api
	module V1
		class UsersController < ActionController::Base
			prepend_before_filter :get_auth_token, :skip_trackable
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /users
			def index
				if params[:all]
					@users = User.find(:all, order: "users.created_at DESC")
				elsif params[:auth_token] 
					@users = User.find_by_authentication_token(params[:auth_token])
				else
					@users = User.find(:all, order: "users.created_at DESC")
				end
				render json: @users
			end

			# POST /users
			def create
				@new_user = User.create(params[:user])
				render json: @new_user
			end

			# GET /users/1
			def show
				@user = User.find(params[:id])
				render json: @user
			end

			# PUT /users/1
			def update
				debugger
				@user = User.update(params[:id], params[:user])
				render json: @user
			end

			# DELETE /users/1
			def destroy
				respond_with User.destroy(params[:id])
			end

			protected
			def get_auth_token
	  			params[:auth_token] = request.headers["Auth_token"]
		  	end

		  	def skip_trackable
		      request.env['devise.skip_trackable'] = true
		    end
		end
	end
end