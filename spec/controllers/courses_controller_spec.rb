require 'rails_helper'
RSpec.describe CoursesController, type: :controller do
  let(:department) {FactoryBot.create(:department, name: 'CSE') }
  let(:course) {FactoryBot.create(:course, department_id: department.id, name: 'Marketing Management', course_code: 113) }
  let(:invalid_course) {FactoryBot.attributes_for(:course, name: nil, course_code: nil) }
  let(:valid_course) {FactoryBot.attributes_for(:course, name: 'Marketing Management', course_code: 113) }


  describe "GET index" do
    it "assigns @department" do
      get :index, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @courses" do
      get :index, department_id: department
      expect(assigns(:courses)).to eq(department.courses)
    end
    it "renders the index template" do
      get :index, department_id: department
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "assigns @department" do
      get :index, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @courses" do
      get :index, id: course, department_id: department
      expect(assigns(:courses)).to eq(department.courses)
    end
    it "assigns @section" do
      section = FactoryBot.create(:section, id: course, section_no: 5)
      get :show, id: section, id: course, department_id: department
      expect(assigns(:section)).to eq(course.sections)
    end
  end

  describe "GET new" do
    it "assigns @department" do
        get :index, department_id: department
        expect(assigns(:department)).to eq(department)
    end
    it "assigns @course" do
      get :new, id: course.id, department_id: department.id
      expect(assigns(:course)).to be_a_new(Course)
    end
    it "renders the new template" do
      get :new, department_id: department
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new course" do
        expect{
          post :create, department_id: department, course: valid_course
        }.to change(Course,:count).by(1)
      end
      it "redirect to the :new template" do
        post :create, department_id: department, course: valid_course
        expect(response).to redirect_to department_courses_path(action: :index)
      end
    end

    context "with invalid attributes" do
      it "does not save new course" do
        expect{
          post :create, department_id: department, course: invalid_course
        }.not_to change(Course,:count)
      end

      it "re-render the :new template" do
        post :create, department_id: department, course: invalid_course
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    it "assigns @department" do
      get :edit, id: course, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @course" do
      get :edit, id: course, department_id: department
      expect(assigns(:course)).to eq(course)
    end
    it "renders the new template" do
      get :edit, id: course, department_id: department
      expect(response).to render_template :edit
    end
  end

  describe "PATCH#update" do
    before :each do
     @department = FactoryBot.create(:department, name: 'Marketing')
     @course = FactoryBot.create(:course, department_id: @department.id, name: 'Marketing Management', course_code: 113)
    end
    context "valid attributes" do
      it " locates the requested @course" do
        patch :update, id: @course.id, department_id: @department.id, course: FactoryBot.attributes_for(:course)
        expect(assigns(:course)).to eq(@course)
      end

      it "changes requested attributes of @course" do
        patch :update, id: @course.id, department_id: @department, course: FactoryBot.attributes_for(:course, name: 'Marketing Management', course_code: 113)
        @course.reload
        expect(@course.name).to eq('Marketing Management')
      end
      it "redirects to the updated course " do
        patch :update, id: @course, department_id: @department, course: FactoryBot.attributes_for(:course)
        expect(response).to redirect_to(department_course_path)
      end
    end
  end
end