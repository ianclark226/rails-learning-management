class Lession < ApplicationRecord
  has_one_attached :video do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 500, 500 ]
  end

  acts_as_list

    belongs_to :course
    has_many :lession_users, dependent: :destroy

    def next_lession
      course.lessions.where("position > ?", position).order(:position).first
    end

    def previous_lession
      course.lessions.where("position < ?", position).order(:position).last
    end
end
