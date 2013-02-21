module Api
	module V1
		class RoutesController < ActionController::Base
			prepend_before_filter :get_auth_token, :skip_trackable
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /routes
			def index
				if params[:gym_id] 
					if not params[:include_retired]
						conditions = ["routes.gym_id=(?) AND routes.retirement_date is NULL", params[:gym_id]]
					else
						conditions = ["routes.gym_id=(?)", params[:gym_id]]	
					end					
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
				@route = Route.find(params[:id])
				render json: @route
			end

			# PUT /routes/1
			def update
				@route = Route.update(params[:id], params[:route])
				render json: @route
			end

			# DELETE /routes/1
			def destroy
				@route = Route.find(params[:id])
				@route.destroy
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