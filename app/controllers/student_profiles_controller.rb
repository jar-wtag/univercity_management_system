class StudentProfilesController < ApplicationController

  def index
    @student_profiles = StudentProfile.where(id: params[:ids])
    @section = Section.find_by(id: params[:section_id])

    # student_id = @section.student_profiles.pluck(:student_id)
    # section_student = @section.course.department.students.ids
    # @rest_students = Student.where(id: (section_student - student_id)).ids
    #@rest_students = @section.course.department.students.ids
    @students = @section.course.department.students.includes(:student_profiles).where.not(id: StudentProfile.select(:student_id)).ids
  end

  def show
    @student_profile = StudentProfile.find_by(id: params[:id])
    @section = Section.find(params[:section_id])
    @student = @student_profile.student
  end

  def new
   @section = Section.find_by(id: params[:section_id])
   @students = @section.course.department.students.includes(:student_profiles).where.not(id: StudentProfile.select(:student_id))
  end
  def create
    @section = Section.find_by(id: params[:section_id])
    @student = Student.find_by(id: params[:student_id])
    #if !StudentProfile.pluck(:student_id).include?(@student.id)
    if @student_profile = @student.student_profiles.create(params.permit(:section_id, :student_id, :name, :age, :roll))
      flash[:success] = "This student has added"
      redirect_to(student_profiles_path(ids: @section.student_profiles.ids, section_id: @section.id))
      #end
    else
      render(new_student_profiles_path(ids: StudentProfiles.student_id).ids)
      #redirect_to(new_student_profile_path(student_id: params[:ids]), section_id: @section.id)
    end
    # if @student_profile = @student.student_profiles.create(params.permit(:section_id, :student_id, :name, :age, :roll))
    #   flash[:success] = "This student has added"
    #   redirect_to(student_profiles_path(ids: @section.student_profiles.ids, section_id: @section.id))
    # else
    #   render :new
    # end
  end

  # def edit
  #   @student_profile = StudentProfile.find_by(id: params[:id])
  #   @section = Section.find_by(id: params[:section_id])
  #   @student = @student_profile.student
  # end
  #
  # def update
  #     @section = Section.find_by(id: params[:section_id])
  #     @student = Student.find_by(id: params[:student_id])
  #     if @student_profile = @student.student_profiles.update_attributes(params.permit(:section_id, :student_id, :name, :age, :roll, :year, :result))
  #       redirect_to(student_profiles_path(ids: @section.student_profiles.ids, section_id: @section.id))
  #     else
  #       render :new
  #     end
  # end

  # private
  #  def student_profile_params
  #   params.require(:student_profile).permit(:section_id, :student_id, :name, :age, :roll, :year, :result)
  # end

end
