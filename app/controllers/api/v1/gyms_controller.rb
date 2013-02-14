module Api
	module V1
		class GymsController < ActionController::Base
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /gyms
			def index
				@gyms = Gym.all
				render json: @gyms
			end

			# POST /gyms
			def create
				@newGym = Gym.create(name: params[:name], 
									 street_address: params[:street_address],
									 city: params[:city],
									 state: params[:state],
									 zip: params[:zip])

				render json: @newGym
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