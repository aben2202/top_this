module Api
	module V1
		class RouteCompletionsController < ActionController::Base
			respond_to :json

			# GET /route_completions
			def index
				debugger
				if params[:route]
					@route_completions = RouteCompletion.where route: params[:route]
				else
					@route_completions = RouteCompletion.all
				end
				render json: @route_completions
			end

			# POST /route_completions
			def create
				respond_with RouteCompletion.create(params[:route_completion])
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