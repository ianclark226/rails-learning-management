class LessionsController < ApplicationController
  before_action :set_lession, only: %i[ show update ]
  before_action :set_course
  before_action :check_paid

  # GET /lessions/1 or /lessions/1.json
  def show
    @completed_lessions = current_user.lession_users.where(completed: true).pluck(:lession_id)
    @course = @lession.course
    @paid_for_course = current_user.course_users.where(course: @course).exists?
    puts "paid_for_course: #{@paid_for_course}"
  end

  def update
    @lession_user = LessionUser.find_or_create_by(user: current_user, lession: @lession)
    @lession_user.update!(completed: true)
    next_lession = @course.lessions.where("position > ?", @lession.position).order(:position).first
    if next_lession
      redirect_to course_lession_path(@course, next_lession)
    else
      redirect_to course_path(@course), notice: "You've completed the course"
    end
  end

  private
    def set_course
      @course = Course.find(params[:course_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lession
      @lession = Lession.find(params[:id])
    end

    def check_paid
      if @lession.paid && !current_user.course_users.where(course_id: params[:course_id]).exists?
        if @lession.previous_lession
          redirect_to course_lession_path(@course, @lession.previous_lession), notice: "You must purchase the full course to access the next lession"
        else
          redirect_to course_path(@course), notice: "You must purchase the full course to access the next lession"
        end
      end
    end
end
