class Lession < ApplicationRecord
  has_one_attached :video
    belongs_to :course
    has_many :lession_users, dependent: :destroy
end
