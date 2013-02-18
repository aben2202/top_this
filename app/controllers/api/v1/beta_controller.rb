module Api
	module V1
		class BetaController < ActionController::Base
			respond_to :json

			# GET /beta
			def index
				if params[:route_id]
					conditions = "beta.route_id=(?)", params[:route_id]
					order = "beta.date DESC"
					@beta = Beta.where(conditions).order(order)
				elsif params[:user_id]
					conditions = "beta.user_id=(?)", params[:user_id]
					order = "beta.date DESC"
					@beta = Beta.where(conditions).order(order)
				else
					@beta = Beta.all
				end
				render json: @beta
			end

			# POST /beta
			def create
				@new_beta = Beta.new
				@new_beta.user_id = params[:beta][:user_id].to_i
				@new_beta.route_id = params[:beta][:route_id].to_i
				@new_beta.date = Date.today.to_s
				@new_beta.save

				render json: @new_beta
			end

			# GET /beta/1
			def show
				respond_with Beta.find(params[:id])
			end

			# PUT /beta/1
			def update
				respond_with Beta.update(params[:id], params[:beta])
			end

			# DELETE /beta/1
			def destroy
				respond_with Beta.destroy(params[:id])
			end
		end
	end
end