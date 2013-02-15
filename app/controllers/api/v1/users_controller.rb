module Api
	module V1
		class UsersController < ActionController::Base
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /users
			def index
				if params[:auth_token] 
					@users = User.find_by_authentication_token(params[:auth_token])
				else
					@users = User.all
				end
				render json: @users
			end

			# POST /users
			def create
				debugger
				@new_user = User.create(params[:user])
				render json: @new_user
			end

			# GET /users/1
			def show
				respond_with User.find(params[:id])
			end

			# PUT /users/1
			def update
				respond_with User.update(params[:id], params[:user])
			end

			# DELETE /users/1
			def destroy
				respond_with User.destroy(params[:id])
			end
		end
	end
end