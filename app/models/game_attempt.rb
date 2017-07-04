class GameAttempt < ApplicationRecord
  belongs_to :game, polymorphic: true
  belongs_to :game_session
  belongs_to :user
end
