require 'rails_helper'
RSpec.describe DepartmentsController, type: :controller do
  let(:department) {FactoryBot.create(:department, name: 'CSE') }
  let(:invalid_department) {FactoryBot.attributes_for(:department, name: nil) }
  let(:valid_department_attributes) {FactoryBot.attributes_for(:department)}

  describe "GET index" do
    it "assigns @departments" do
      departments = Department.sorted
      get :index
      expect(assigns(:departments).to_a).to eq(departments.to_a)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "assigns @department" do
      #department = Department.create(name: "CSE")
      get :show, id: department
      expect(assigns(:department)).to eq(department)
    end

    it "renders the show template" do
      #department = Department.create(name: "CSE")
      get :show, id: department
      expect(response).to render_template :show
    end
    it "assigns @course" do
     # department = Department.create(name: "CSE")
      course = FactoryBot.create(:course, id: department.id, name: 'Fundamental Marketing', course_code: 101)
      get :show, id: course, id: department.id
      expect(assigns(:course)).to eq(department.courses)
    end
    it "assigns @student" do
      #department = Department.create(name: "CSE")
      student = FactoryBot.create(:student, id: department.id, name: 'Shakil', age: 33, roll: 35)
      get :show, id: student, id: department.id
      expect(assigns(:student)).to eq(department.students)
    end
  end

  describe "GET new" do
    it "assigns @department" do
      get :new
      expect(assigns(:department)).to be_a_new(Department)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new department" do
        expect{
          post :create, department: valid_department_attributes
        }.to change(Department,:count).by(1)
      end

      it "redirects to department#index" do
        post :create, department: valid_department_attributes
        expect(response).to redirect_to departments_path(action: :index)
      end
    end

    context "with invalid attributes" do
      it "does not save new department" do
        expect{
          post :create, department: invalid_department
        }.not_to change(Department,:count)
      end

      it "re-render the :new template" do
        post :create, department: invalid_department
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    it "assigns @department" do
      #department = Department.create(name: "CSE")
      get :show, id: department
      expect(assigns(:department)).to eq(department)
    end

    it "renders the edit template" do
      #department = Department.create(name: "CSE")
      get :edit, id: department
      expect(response).to render_template :edit
    end
  end

  describe "PATCH#update" do
    before :each do
      @department = Department.create(name: 'CSE')
    end
    context "valid attributes" do
      it " locates the requested @department" do
        patch :update, id: @department, department: FactoryBot.attributes_for(:department)
        expect(assigns(:department)).to eq(@department)
      end

      it "changes requested attributes of @department" do
        patch :update, id: @department, department: FactoryBot.attributes_for(:department, name: 'CSE')
        @department.reload
        expect(@department.name).to eq('CSE')
      end
      it "redirects to the updated department " do
        patch :update, id: @department, department: FactoryBot.attributes_for(:department)
        expect(response).to redirect_to(departments_path)
      end
    end
  end

  # describe "DELETE#destroy" do
  #   before :each do
  #     @department = Department.create(name: 'CSE')
  #   end
  #
  #   it " deletes the department" do
  #     expect{
  #       delete :destroy, id: @department
  #     }.to change(Department,:count).by(-1)
  #   end
  #
  #   it " deletes the department" do
  #     delete :destroy, id: @department
  #     expect(response).to redirect_to deapartment_url
  #   end
  # end
end
