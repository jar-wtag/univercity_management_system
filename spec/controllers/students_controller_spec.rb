require 'rails_helper'
RSpec.describe StudentsController, type: :controller do
  let(:department) {FactoryBot.create(:department, name: 'CSE') }
  let(:student) {FactoryBot.create(:student, department_id: department.id, name: 'Mossadek Hossain', age: 35, roll: 45)}
  let(:invalid_student_attributes) {FactoryBot.attributes_for(:student, name: nil, age: nil, roll: nil)}
  let(:valid_student_attributes) {FactoryBot.attributes_for(:student, name: 'Mossadek Hossain', age: 35, roll: 45)}

  describe "GET index" do
    it "assigns @department" do
      get :index, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @students" do
      get :index, department_id: department
      expect(assigns(:students)).to eq(department.students)
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
    it "assigns @student" do
      get :show, id: student, department_id: department
      expect(assigns(:student)).to eq(student)
    end
  end

  describe "GET new" do
    it "assigns @department" do
      get :index, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @student" do
      get :new, department_id: department
      expect(assigns(:student)).to be_a_new(Student)
    end
    it "renders the new template" do
      get :new, department_id: department
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new student" do
        expect{
          post :create, department_id: department, student: valid_student_attributes
        }.to change(Student,:count).by(1)
      end
      it "redirect to the :new template" do
        post :create, department_id: department, student: valid_student_attributes
        expect(response).to redirect_to department_students_path(action: :index)
      end
    end

    context "with invalid attributes" do
      it "does not save new student" do
        expect{
          post :create, department_id: department, student: invalid_student_attributes
        }.not_to change(Student,:count)
      end

      it "re-render the :new template" do
        post :create, department_id: department, student: invalid_student_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "GET edit" do
    it "assigns @department" do
      get :edit, id: student, department_id: department
      expect(assigns(:department)).to eq(department)
    end
    it "assigns @student" do
      get :edit, id: student, department_id: department
      expect(assigns(:student)).to eq(student)
    end
    it "renders the new template" do
      get :edit, id: student, department_id: department
      expect(response).to render_template :edit
    end
  end

  describe "PATCH#update" do
    before :each do
      @department = Department.create(name: 'CSE')
      @student = FactoryBot.create(:student, department_id: @department.id, name: 'Mossadek Hossain', age: 35, roll: 45)
    end
    context "valid attributes" do
      it " locates the requested @student" do
        patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student)
        expect(assigns(:student)).to eq(@student)
      end

      it "changes requested attributes of @student" do
        patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student, name: 'Mossadek Hossain', age: 35, roll: 45)
        @student.reload
        expect(@student.name).to eq('Mossadek Hossain')
      end
      it "redirects to the updated student " do
        patch :update, id: @student, department_id: @department, student: FactoryBot.attributes_for(:student)
        expect(response).to redirect_to(department_student_path)
      end
    end
  end

  describe "DELETE#destroy" do
    before :each do
      @department = Department.create(name: 'CSE')
      @student = FactoryBot.create(:student, department_id: @department.id, name: 'Mossadek Hossain', age: 35, roll: 45)
    end

    it " deletes the student" do
      expect{
        delete :destroy, id: @student, department_id: @department
      }.to change(Student,:count).by(-1)
    end

    it " deletes the student" do
      delete :destroy, id: @student, department_id: @department
      expect(response).to redirect_to department_students_path
    end
  end
end