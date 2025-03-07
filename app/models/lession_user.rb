class LessionUser < ApplicationRecord
  belongs_to :lession
  belongs_to :user
end
