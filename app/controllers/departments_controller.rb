class DepartmentsController < ApplicationController


  def index
    @departments = Department.sorted
  end

  def show
    @department = Department.find(params[:id])
    @course = @department.courses
    @student = @department.students
  end

  def new
    @department = Department.new()
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "{name} has been created successfully!"
      redirect_to(departments_path)
    else
      flash[:errors] = @department.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    @department.update_attributes(department_params)
    if @department.save
      flash[:notice] = "The Department has been updated successfully!"
      redirect_to(departments_path)
    else
      flash[:errors] = @department.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to(departments_path, notice: 'Delete Success!')
  end

  private
    def department_params
      params.require(:department).permit(:name, :credit)
    end

end

