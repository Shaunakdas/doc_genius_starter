class Api::GameController < ApiController
	skip_before_action :authenticate_user!, raise: false
  	protect_from_forgery :except => :submit
	def list
		user_id=params[:user_id]
		# TODO
		# Find User based on user_id
		# Find UserAcadProfile of acad_entity_type Standard
		response ={}
		# TODO
		# Return Standard Object 
	    render json: response.to_json, status: 200
	end
	def intro
		# TODO
		# Find User based on user_id
		# Find UserAcadProfile of acad_entity_type Standard
		response ={}
	    render json: response.to_json, status: 200
	end
	def start
		response ={}
	    render json: response.to_json, status: 200
	end
	def submit
		response ={}
	    render json: response.to_json, status: 200
	end
end
