class StudentsController < ApplicationController

  layout 'application'

  def index
    @department = Department.find(params[:department_id])
    @students = @department.students
  end

  def show
    @department = Department.find(params[:department_id])
    @student = @department.students.find(params[:id])
  end

  def new
    @department = Department.find(params[:department_id])
    @student = Student.new(department_id: params[:department_id])
  end

  def create
    @department = Department.find_by(id: params[:department_id])
    @student = @department.students.create(student_params)
    if @student.save
      flash[:notice] = "The student has been created successfully!"
      redirect_to(department_students_path)
    else
      render('new')
    end
  end

  def edit
    @department = Department.find_by(id: params[:department_id])
    @student = @department.students.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.update_attributes(student_params)
    if @student.save
      redirect_to(department_student_path)
    else
      render('edit')
    end
  end

  def destroy
    @department = Department.find(params[:department_id])
    @student = @department.students.find(params[:id])
    @student.destroy
      redirect_to(department_students_path, notice: 'Delete Success!')
  end

  private
  def student_params
    params.require(:student).permit(:name, :age, :roll,
      student_profile_ids: [], student_profiles_attributes:[:year, :result])
  end

end
