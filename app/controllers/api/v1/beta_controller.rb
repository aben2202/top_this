module Api
	module V1
		class BetaController < ActionController::Base
			prepend_before_filter :get_auth_token, :skip_trackable
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /beta
			def index
				if params[:route_id]
					conditions = "beta.route_id=(?)", params[:route_id]
					order = "beta.created_at DESC"
					@beta = Beta.where(conditions).order(order)
				elsif params[:user_id]
					conditions = "beta.user_id=(?)", params[:user_id]
					order = "beta.created_at DESC"
					@beta = Beta.where(conditions).order(order)
				elsif params[:only_pending_beta_requests]
					conditions = "beta.beta_type = 'beta request' AND beta.beta_answered is NULL"
					order = "beta.created_at DESC"
					@beta = Beta.where(conditions).order(order)
				else
					@beta = Beta.all
				end
				render json: @beta
			end

			# POST /beta
			def create
				debugger
				@new_beta = Beta.new
				@new_beta.user_id = params[:beta][:user_id].to_i
				@new_beta.route_id = params[:beta][:route_id].to_i
				@new_beta.comment = params[:beta][:comment]
				@new_beta.beta_type = params[:beta][:beta_type]
				@new_beta.save

				render json: @new_beta
			end

			# GET /beta/1
			def show
				respond_with Beta.find(params[:id])
			end

			# PUT /beta/1
			def update
				@betaToUpdate = Beta.update(params[:id], params[:beta])

				render json: @betaToUpdate
			end

			# DELETE /beta/1
			def destroy
				respond_with Beta.destroy(params[:id])
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