class LessionsController < ApplicationController
  before_action :set_lession, only: %i[ show edit update destroy ]


  # GET /lessions/1 or /lessions/1.json
  def show
    @course = @lession.course
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lession
      @lession = Lession.find(params.expect(:id))
    end
end
