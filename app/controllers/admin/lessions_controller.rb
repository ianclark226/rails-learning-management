class Admin::LessionsController < AdminController
  before_action :set_course
  before_action :set_lession, only: [:move]

  def index
    @admin_lessions = @admin_course.lessions.order(:position)
  end

  def move
    position = params[:position].to_i 
    if position == 0
      @lession.move_to_top
    elsif position == @admin_course.lessions.count - 1
    @lession.move_to_bottom
    else
    @lession.insert_at(position + 1)
  end

  @lession.save!

  render json: { message: "success" }
end 

  private
  def set_course
    @admin_course = Course.find(params[:course_id])
  end

  def set_lession
    @lession = @admin_course.lessions.find(params[:id])
end

end
