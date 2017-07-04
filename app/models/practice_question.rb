class PracticeQuestion < ApplicationRecord
  belongs_to :game_holder
  belongs_to :auto_question
  belongs_to :difficulty_level
end
