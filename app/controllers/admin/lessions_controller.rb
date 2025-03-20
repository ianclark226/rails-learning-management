class Admin::LessionsController < AdminController
  before_action :set_course
  def index
    @admin_lessions = @admin_course.lessions.order(:position)
  end

  private
  def set_course
    @admin_course = Course.find(params[:course_id])
  end
end
