module Api
	module V1
		class RouteCompletionsController < ActionController::Base
			respond_to :json

			# GET /route_completions
			def index
				if params[:route_id]
					@route_completions = RouteCompletion.where route_id: params[:route_id]
				elsif params[:user_id]
					conditions = "route_completions.user_id=(?)", params[:user_id]
					order = "route_completions.created_at DESC"
					@route_completions = RouteCompletion.where(conditions).order(order)
				elsif params[:gym_id]
					joins = "join routes on routes.id = route_completions.route_id"
					conditions = "routes.gym_id=(?)", params[:gym_id]
					order = "route_completions.created_at DESC"
					if params[:page]
						@route_completions = RouteCompletion.paginate(per_page: 20, page: params[:page]).find(:all,
																  joins: joins,
															 	  conditions: conditions,
															   	  order: order)
					else
						@route_completions = RouteCompletion.find(:all,
																  joins: joins,
															 	  conditions: conditions,
															   	  order: order)
					end
				else
					@route_completions = RouteCompletion.all
				end
				render json: @route_completions
			end

			# POST /route_completions
			def create
				debugger
				@new_completion = RouteCompletion.new
				@new_completion.completion_type = params[:route_completion][:completion_type]
				@new_completion.climb_type = params[:route_completion][:climb_type]
				@new_completion.user_id = params[:route_completion][:user_id].to_i
				@new_completion.route_id = params[:route_completion][:route_id].to_i
				@new_completion.completion_date = DateTime.now
				if params[:route_completion][:send_date]
					@new_completion.send_date = params[:route_completion][:send_date]
				end
				@new_completion.save

				render json: @new_completion
			end

			# GET /route_completions/1
			def show
				respond_with RouteCompletion.find(params[:id])
			end

			# PUT /route_completions/1
			def update
				@completion = RouteCompletion.update(params[:id], params[:route_completion])
				if not params[:route_completion][:send_date]
					@completion.update_attributes(send_date: nil)
				end
				render json: @completion
			end

			# DELETE /route_completions/1
			def destroy
				respond_with RouteCompletion.destroy(params[:id])
			end
		end
	end
end