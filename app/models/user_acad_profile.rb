class UserAcadProfile < ApplicationRecord
  belongs_to :acad_entity, polymorphic: true
  belongs_to :user
end
