module Api
	module V1
		class GymsController < ActionController::Base
			respond_to :json

			# GET /gyms
			def index
				respond_with Gym.all
			end

			# POST /gyms
			def create
				respond_with Gym.create(params[:route])
			end

			# GET /gyms/1
			def show
				respond_with Gym.find(params[:id])
			end

			# PUT /gyms/1
			def update
				respond_with Gym.update(params[:id], params[:route])
			end

			# DELETE /gyms/1
			def destroy
				respond_with Gym.destroy(params[:id])
			end
		end
	end
end