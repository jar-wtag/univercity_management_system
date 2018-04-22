require 'rails_helper'
RSpec.describe StudentProfilesController, type: :controller do
  let(:student_profiles) {FactoryBot.create(:student_profile) }
  let(:section) {FactoryBot.create(:section) }

  describe "GET index" do
    it "assigns @student_profiles" do
      get :index, params: { ids: student_profiles.id, section_id: section.id }
      expect(assigns(:student_profiles)).to eq(section.student_profiles)
    end

    it "assigns @section" do
      get :index, section_id: student_profiles.section.id
      expect(assigns(:section)).to eq(student_profiles.section)
    end
  end

  describe "GET show" do
    it "assigns @student_profiles" do
        get :index, params: { id: student_profiles.id, section_id: section.id }
        expect(assigns(:student_profiles)).to eq(section.student_profiles)
    end
    it "assigns @section" do
      get :index, section_id: student_profiles.section.id
      expect(assigns(:section)).to eq(student_profiles.section)
    end
    it "assigns @student" do
      get :index, section_id: student_profiles.student.id
      expect(assigns(:student)).to eq(@student)
    end
  end

  describe "GET new" do
    it "assigns @section" do
      get :new, section_id: student_profiles.section.id
      expect(assigns(:section)).to eq(student_profiles.section)
    end
    it "assigns @student" do
      section = FactoryBot.create(:section)
      get :new, section_id: student_profiles.section.id
      expect(assigns(:students)).to eq(section.course.department.students)
    end
    it "renders the new template" do
      get :new, section_id: student_profiles.section.id
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      let!(:section) { FactoryBot.create(:section) }
      it "creates a new course" do
        student_profiles = FactoryBot.create(:student_profile)
        #section = FactoryBot.create(:section)
        student = FactoryBot.create(:student, name: 'Sagor', age: 34, roll: 43)
        expect{
          post :create, student_id: student, section_id: student_profiles.section.id, student_profile: FactoryBot.attributes_for(:student_profile)
        }.to change(StudentProfile,:count).by(1)
      end
      it "redirect to the :new template" do
        student_profiles = FactoryBot.create(:student_profile, section_id: section.id)
        #section = FactoryBot.create(:section)
        student = FactoryBot.create(:student, name: 'Sagor', age: 34, roll: 43)
        post :create, student_id: student, section_id: student_profiles.section.id, student_profile: FactoryBot.attributes_for(:student_profile)
        expect(response).to redirect_to student_profiles_path(ids: section.student_profiles.ids, section_id: section.id)
      end
    end

    context "with invalid attributes" do

      # it "re-render the :new template" do
      #   student_profiles = FactoryBot.create(:student_profile)
      #   student = FactoryBot.create(:student, name: 'Sagor', age: 34, roll: 43)
      #   post :create, student_id: student, section_id: student_profiles.section.id, student_profile: FactoryBot.attributes_for(:invalid_student_profile)
      #   expect(response).to render_template :new
      # end
    end
  end

  # describe "GET edit" do
  #   it "assigns @student_profiles" do
  #     student_profiles = FactoryBot.create(:student_profile)
  #     section = FactoryBot.create(:section)
  #     get :edit, id: student_profiles.id, params: { id: student_profiles.id, section_id: section.id }
  #     expect(assigns(:student_profile)).to eq(student_profiles)
  #   end
  #   it "assigns @section" do
  #     student_profiles = FactoryBot.create(:student_profile)
  #     section = FactoryBot.create(:section)
  #     get :edit, id: student_profiles.id, params: { id: student_profiles.id, section_id: section.id }
  #     expect(assigns(:section)).to eq(@section)
  #   end
  #   it "assigns @student" do
  #     student_profiles = FactoryBot.create(:student_profile)
  #     student = FactoryBot.create(:section)
  #     get :edit, student_id: student.id, id: student_profiles.id
  #     expect(assigns(:student)).to eq(student_profiles.student)
  #   end
  #
  #   it "renders the new template" do
  #     student_profiles = FactoryBot.create(:student_profile)
  #     student = FactoryBot.create(:section)
  #     get :edit, student_id: student.id, id: student_profiles.id
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe "PATCH#update" do
  #   before :each do
  #     @department = Department.create(name: 'CSE')
  #     @student = FactoryBot.create(:student, department_id: @department.id, name: 'Mossadek Hossain', age: 35, roll: 45)
  #   end
  #   context "valid attributes" do
  #     it " locates the requested @student" do
  #       patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student)
  #       expect(assigns(:student)).to eq(@student)
  #     end
  #
  #     it "changes requested attributes of @student" do
  #       patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student, name: 'Mossadek Hossain', age: 35, roll: 45)
  #       @student.reload
  #       expect(@student.name).to eq('Mossadek Hossain')
  #     end
  #     it "redirects to the updated student " do
  #       patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student)
  #       expect(response).to redirect_to(department_student_path)
  #     end
  #   end
  # end
end