class Api::GameController < ApiController
	skip_before_action :authenticate_user!, raise: false
  	protect_from_forgery :except => :submit
	def list
		user_id=params[:user_id]
		# TODO
		# Find User based on user_id
		user = User.where(:user_id => user_id).first
		# Find UserAcadProfile of acad_entity_type Standard
		standard_id = UserAcadProfile.where(:user => user, :acad_entity_type => "Standard").first.id
		standard = Standard.where(:id => standard_id).first
		response ={}
		# TODO
		# Return Standard Object 
		standard_obj={}
		standard_obj["code"]=standard.code
		standard_obj["name"]=standard.name
		standard_obj["chapter_list"]=[]
		Chapter.where(:standard => standard).each do |chapter|
			chapter_obj={}
			chapter_obj["code"]=chapter.code
			chapter_obj["name"]=chapter.name
			chapter_obj["sequence"]=chapter.sequence
			chapter_obj["topic_list"]=[]
			Topic.where(:chapter => chapter).each do |topic|
				topic_obj={}
				topic_obj["code"]=topic.code
				topic_obj["name"]=topic.name
				topic_obj["sequence"]=topic.sequence
				topic_obj["sub_topic_list"]=[]
				chapter_obj["topic_list"]=[]
				SubTopic.where(:topic => topic).each do |sub_topic|
					sub_topic_obj={}
					sub_topic_obj["code"]=sub_topic.code
					sub_topic_obj["name"]=sub_topic.name
					sub_topic_obj["sequence"]=sub_topic.sequence
					sub_topic_obj["question_type_list"]=[]
					QuestionType.where(:sub_topic => sub_topic).each do |question_type|
						question_type_obj={}
						question_type_obj["code"]=question_type.code
						question_type_obj["name"]=question_type.name
						question_type_obj["sequence"]=question_type.sequence
						question_type_obj["image_url"]=question_type.image_url
						question_type_obj["game_holder_list"]=[]
						GameHolder.where(:question_Type => question_type).each do |game_holder|
							game_holder_obj={}
							game_holder_obj["code"]=game_holder.code
							game_holder_obj["name"]=game_holder.name
							game_holder_obj["sequence"]=game_holder.sequence
							game_holder_obj["image_url"]=game_holder.image_url
							game_holder_obj["rank_name"]=RankName.where(id => game_holder.rank_name_id).first.name
							question_type_obj["game_holder_list"] << game_holder_obj
						end
						sub_topic_obj["question_type_list"] << question_type_obj
					end
					topic_obj["sub_topic_list"] << topic_obj
				end
				standard_obj["topic_list"] << chapter_obj
			end
		end
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
