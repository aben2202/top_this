module Api
	module V1
		class UsersController < ActionController::Base
			before_filter :authenticate_user!, except: [:index, :show]
			#has_attached_file :profile_pic
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
				@new_user = User.create(params[:user])
				render json: @new_user
			end

			# GET /users/1
			def show
				respond_with User.find(params[:id])
			end

			# PUT /users/1
			def update
				if params[:id] and params[:user]
					User.update(params[:id], params[:user])
				else
					respond_with User.update(params[:id], params[:user])
				end
			end

			# DELETE /users/1
			def destroy
				respond_with User.destroy(params[:id])
			end
		end
	end
end