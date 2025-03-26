class Admin::LessionsController < AdminController
  before_action :set_course
  before_action :set_lession, only: [:move]

  def index
    @admin_lessions = @admin_course.lessions.order(:position)
  end

  def show
    @admin_lession = @admin_course.lessions.find(params[:id])
  end

  def new
    @admin_lession = @admin_course.lessions.new
  end

  def create
    @admin_lession = @admin_course.lessions.new(lession_params)
  
    Rails.logger.info "📂 Params received: #{params.inspect}"  # ✅ Logs all form params
    Rails.logger.info "🎥 Video attached? #{params[:admin_lession][:video].present?}"  # ✅ Logs if video is present
  
    if @admin_lession.save
      redirect_to admin_course_lessions_path(@admin_course)
    else
      Rails.logger.error "❌ Errors: #{@admin_lession.errors.full_messages.join(', ')}"  # ✅ Logs validation errors
      render :new
    end
  end

  def move
    position = params[:position].to_i 
    if position == 0
      @admin_lession.move_to_top
    elsif position == @admin_course.lessions.count - 1
    @admin_lession.move_to_bottom
    else
    @admin_lession.insert_at(position + 1)
  end

  @admin_lession.save!

  render json: { message: "success" }
end 

  private

  def lession_params
    params.require(:lession).permit(:title, :description, :video, :paid, :position)
  end

  def set_course
    @admin_course = Course.find(params[:course_id])
  end

  def set_lession
    @admin_lession = @admin_course.lessions.find(params[:id])
end

end
