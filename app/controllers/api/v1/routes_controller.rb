module Api
	module V1
		class RoutesController < ActionController::Base
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /routes
			def index
				if params[:gym_id] 
					conditions = ["routes.gym_id=(?)", params[:gym_id]]
					order = ["routes.rating"]
					@routes = Route.all(conditions: conditions, order: order)
				else
					@routes = Route.all(order: order)
				end
				render json: @routes
			end

			# POST /routes
			def create
				@newRoute = Route.create(params[:route])
				@newRoute.set_date = Date.today.to_s
				@newRoute.rating = @newRoute.rating.upcase
				@newRoute.save

				render json: @newRoute
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