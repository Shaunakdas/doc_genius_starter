class AddUserPhoneNumberRefToAuthToken < ActiveRecord::Migration[5.0]
  def change
    add_reference :auth_tokens, :user_phone_number, foreign_key: true
  end
end
