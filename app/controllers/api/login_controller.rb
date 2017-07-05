class Api::LoginController < ApiController
	skip_before_action :authenticate_user!, raise: false
  	protect_from_forgery :except => :otp_check
	def user_data
		name = params[:name]
		email = params[:email]
		oauth = params[:oauth]
		number = params[:number]
		standard_id = params[:standard]
		device_id = params[:device_id]
		# TODO
		# Find Or Create User based on name, email, oauth
		user = User.where(:email => email).first
		if not user
			user = User.create(:name => name,:email => email) 
			user.update_column(:oauth => oauth)
		end
		# Find Or Create UserPhoneNumber based on user, number
		user_phone_num = UserPhoneNumber.where(:user => user, :number => number).first
		user_phone_num = UserPhoneNumber.create(:user => user, :number => number) if not user_phone_num
		# Find Or Create UserPhoneNumber based on user, number
		otp = create_otp
		user_auth = UserAuth.create(:user => user, :user_phone_number => user_phone_num, :otp=> otp, :device_id => device_id)
		# Find Or Create UserAcadProfile based on user, standard_id
		user_acad_profile = UserAcadProfile.where(:user => user, :acad_entity_id => standard_id, :acad_entity_type => "Standard").first
		user_acad_profile = UserAcadProfile.create(:user => user, :acad_entity_id => standard_id, :acad_entity_type => "Standard") if not user_acad_profile
		
		response ={}
		# TODO
		# Return user_id
		response["user_id"] = user.id
	    render json: response.to_json, status: 200
	end
	def otp_check
		otp = params[:otp]
		number = params[:number]
		user_id = params[:user_id]
		# TODO
		# Find User based on user_id
		user = User.where(:email => email).first
		auth_token = AuthToken.where(:user => user, :number => number, :otp => otp).first
		
		response ={}
		# TODO
		# Return user_id
		# Return auth_token
		if auth_token
			response["authenticated"]=true
			response["auth_token"]=auth_token.auth_token
			response["user_id"] = user.id
		else
			response["authenticated"]=false
		end
	    render json: response.to_json, status: 200
	end

	def create_otp
	    otp = rand(9999)
	  end
end