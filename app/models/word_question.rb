class WordQuestion < ApplicationRecord
  belongs_to :game_holder
  belongs_to :difficulty_level
end
