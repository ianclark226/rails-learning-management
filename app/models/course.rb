class Course < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end
  has_many :lessions
  has_and_belongs_to_many :categories

  def first_lession
    self.lessions.order(:position).first
  end

  def next_lession(current_user)
    if current_user.blank?
      return self.lessions.order(:position).first
    end

    completed_lessions = current_user.lession_users.includes(:lession).where(completed: true).where(lessions: { course_id: self.id })
    started_lessions = current_user.lession_users.includes(:lession).where(completed: true).where(lession: { course_id: self.id }).order(:position)

    if started_lessions.any?
      return started_lessions.first.lession
    end

    lessions = self.lessions.where.not(id: completed_lessions.pluck(:lession_id)).order(:positioin)
    if lessions.any?
      lessions.first
    else
      self.lessions.order(:position).first
    end
  end
end
