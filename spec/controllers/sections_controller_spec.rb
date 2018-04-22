require 'rails_helper'
RSpec.describe SectionsController, type: :controller do
  let(:department) {FactoryBot.create(:department, name: 'CSE') }
  let(:course) {FactoryBot.create(:course, department_id: department.id, name: 'Marketing Management', course_code: 113) }

  describe "GET index" do
    it "assigns @department" do
      get :index, course_id: course.id, department_id: department.id
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @course" do
      get :index, course_id: course.id, department_id: department
      expect(assigns(:course)).to eq(course)
    end
    it "assigns @sections" do
      get :index, course_id: course, department_id: department
    end
    it "renders the index template" do
      get :index, course_id: course, department_id: department
      expect(response).to render_template :index
    end
  end
  describe "GET show" do
    it "assigns @department" do
      get :index, course_id: course.id, department_id: department.id
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @course" do
      get :index, course_id: course.id, department_id: department
      expect(assigns(:course)).to eq(course)
    end
    it "assigns @section" do
      section = FactoryBot.create(:section, course_id: course.id, section_no: 114)
      get :index, id: section, course_id: course.id, department_id: department
      expect(assigns(:section)).to eq(@section)
    end
  end
  describe "GET new" do
    it "assigns @department" do
      get :new, course_id: course.id, department_id: department.id
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @course" do
      get :new, course_id: course.id, department_id: department
      expect(assigns(:course)).to eq(course)
    end
    it "assigns @section" do
      get :new, course_id: course.id, department_id: department
      expect(assigns(:section)).to be_a_new(Section)
    end
    it "renders the new template" do
      get :new, course_id: course.id, department_id: department
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new section" do
        expect{
          post :create, course_id: course.id, department_id: department, section: FactoryBot.attributes_for(:section)
        }.to change(Section,:count).by(1)
      end
      it "redirect to the :new template" do
        post :create, course_id: course, department_id: department, section: FactoryBot.attributes_for(:section)
        expect(response).to redirect_to department_course_sections_path(action: :index)
      end
    end

    context "with invalid attributes" do
      it "does not save new course" do
        expect{
          post :create, course_id: course, department_id: department, section: FactoryBot.attributes_for(:invalid_section)
        }.not_to change(Section,:count)
      end

      it "re-render the :new template" do
        post :create, course_id: course, department_id: department, section: FactoryBot.attributes_for(:invalid_section)
        expect(response).to render_template :new
      end
    end
  end
end