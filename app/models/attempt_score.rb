class AttemptScore < ApplicationRecord
  belongs_to :game_attempt
  belongs_to :game_holder
end
