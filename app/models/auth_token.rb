class AuthToken < ApplicationRecord
  before_create :create_auth_token
  belongs_to :user


  validates :number, presence: true
  validates :user, presence: true


  def create_auth_token
    self.auth_token = ""
    32.times.each{
      self.auth_token += CHARS[rand(34)+1]
    }
    self.auth_token
  end
end
