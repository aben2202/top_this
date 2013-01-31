module Api
	module V1
		class RoutesController < ActionController::Base
			respond_to :json

			# GET /routes
			def index
				respond_with Route.all
			end

			# POST /routes
			def create
				respond_with Route.create(params[:route])
			end

			# GET /routes/1
			def show
				respond_with Route.find(params[:id])
			end

			# PUT /routes/1
			def update
				respond_with Route.update(params[:id], params[:route])
			end

			# DELETE /routes/1
			def destroy
				respond_with Route.destroy(params[:id])
			end
		end
	end
end