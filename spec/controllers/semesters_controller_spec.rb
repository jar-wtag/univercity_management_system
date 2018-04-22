require 'rails_helper'
RSpec.describe SemestersController, type: :controller do
 # let(:department) {FactoryBot.create(:department, name: 'CSE') }

  describe "GET index" do
    it "assigns @semesters" do
      semesters = Semester.sorted
      get :index
      expect(assigns(:semesters).to_a).to eq(semesters.to_a)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    it "assigns @semester" do
      get :new
      expect(assigns(:semester)).to be_a_new(Semester)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new semester" do
        # expect{
        #   post :create, semester: FactoryBot.attributes_for(:semester)
        # }.to change(Semester,:count).by(1)
        post :create, semester: FactoryBot.attributes_for(:semester)
        expect(Semester.count).to eq(1)
      end

      it "redirects to semester#index" do
        post :create, semester: FactoryBot.attributes_for(:semester)
        expect(response).to redirect_to semesters_path(action: :index)
      end
    end

    context "with invalid attributes" do
      it "does not save new semester" do
        expect{
          post :create, semester: FactoryBot.attributes_for(:invalid_semester)
        }.not_to change(Semester,:count)

      end
      it "re-render the :new template" do
        post :create, semester: FactoryBot.attributes_for(:invalid_semester)
        get :new
        expect(response).to render_template :new
      end
    end
  end
end