module Api
	module V1
		class GymsController < ActionController::Base
			prepend_before_filter :get_auth_token, :skip_trackable
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# GET /gyms
			def index
				@gyms = Gym.all
				render json: @gyms
			end

			# POST /gyms
			def create
				@newGym = Gym.create(name: params[:gym][:name], 
									 street_address: params[:gym][:street_address],
									 city: params[:gym][:city],
									 state: params[:gym][:state],
									 zip: params[:gym][:zip])

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