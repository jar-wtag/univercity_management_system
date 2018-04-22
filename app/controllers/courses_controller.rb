class CoursesController < ApplicationController

  layout 'application'

  def index
    @department = Department.find(params[:department_id])
    @courses = @department.courses
  end

  def show
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:id])
    @section = @course.sections
  end

  def new
    @department = Department.find(params[:department_id])
    @course = Course.new(department_id: [:department_id])
  end

  def create
    @department = Department.find(params[:department_id])
    @course = @department.courses.create(course_params)
    if @course.save
      flash[:notice] = "The course has been created successfully!"
      redirect_to(department_courses_path)
    else
      flash[:errors] = @course.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:id])
  end

  def update
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:id])
    @course.update_attributes(course_params)
    if @course.save
      flash[:notice] = "The course has been updated successfully!"
      redirect_to(department_course_path)
    else
      flash[:errors] = @course.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @department = Department.find_by(id: params[:department_id])
    @course = @department.courses.find_by(id: params[:id])
    @course.destroy
    redirect_to(department_courses_path)
  end

  private
  def course_params
    params.require(:course).permit(:name, :course_code)
  end
end
