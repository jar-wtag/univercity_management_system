class SectionsController < ApplicationController

  layout  'application'

  def index
    @department = Department.find_by(id: params[:department_id])
    @course = @department.courses.find_by(id: params[:course_id])
    @section = Section.where(id: params[:ids])
    @sections = @course.sections.sorted
  end

  def show
    @department = Department.find_by(id: params[:department_id])
    @course = @department.courses.find_by(id: params[:course_id])
    @section = @course.sections.find_by(id: params[:id])
  end

  def new
    @department = Department.find_by(id: params[:department_id])
    @course = @department.courses.find_by(id: params[:course_id])
    @section = Section.new(course_id: params[:course_id])
  end

  def create
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:course_id])
    @section = @course.sections.create(section_params)
    
    if @section.save
      flash[:notice] = "The section has been created successfully!"
      redirect_to(department_course_sections_path)
    else
      render('new')
    end
  end

  private
    def section_params
      params.require(:section).permit(:section_no)
    end
end
