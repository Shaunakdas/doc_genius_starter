class Api::LoginController < ApiController
	skip_before_action :authenticate_user!, raise: false
  	protect_from_forgery :except => :otp_check
	def user_data
		name = params[:name]
		email = params[:email]
		oauth = params[:oauth]
		number = params[:number]
		standard_id = params[:standard]
		# TODO
		# Find Or Create User based on name, email, oauth,
		# Find Or Create UserPhoneNumber based on user, number
		# Find Or Create UserAcadProfile based on user, standard_id
		
		response ={}
		# TODO
		# Return user_id
	    render json: response.to_json, status: 200
	end
	def otp_check
		otp = params[:otp]
		number = params[:number]
		user_id = params[:user_id]
		device_id = params[:device_id]
		# TODO
		# Find User based on user_id
		# Update User Row
		# Create Auth based on user,number,otp,device_id
		
		response ={}
		# TODO
		# Return user_id
		# Return auth_token
	    render json: response.to_json, status: 200
	end
end