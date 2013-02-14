module Api
	module V1
		class RouteCompletionsController < ActionController::Base
			respond_to :json

			# GET /route_completions
			def index
				if params[:route_id]
					@route_completions = RouteCompletion.where route_id: params[:route_id]
				else
					@route_completions = RouteCompletion.all
				end
				render json: @route_completions
			end

			# POST /route_completions
			def create
				@new_completion = RouteCompletion.create(params[:route_completion])
				@new_completion.completion_date = Date.today.to_s
				@new_completion.save

				render json: @new_completion
			end

			# GET /route_completions/1
			def show
				respond_with RouteCompletion.find(params[:id])
			end

			# PUT /route_completions/1
			def update
				respond_with RouteCompletion.update(params[:id], params[:route_completion])
			end

			# DELETE /route_completions/1
			def destroy
				respond_with RouteCompletion.destroy(params[:id])
			end
		end
	end
end