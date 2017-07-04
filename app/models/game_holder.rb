class GameHolder < ApplicationRecord
  belongs_to :question_type
  belongs_to :rank_name
end
