class SemestersController < ApplicationController


  def index
    @semesters = Semester.sorted
  end

  def show
    #@semester = Semester.find_by(id: params[:id])
  end

  def new
    @semester = Semester.new()
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_to(semesters_path)
    else
      render('new')
    end
  end

  private
    def semester_params
      params.require(:semester).permit(:name, :duration_in_month)
    end
end
