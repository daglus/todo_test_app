require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user

  describe "GET index" do
    it "render index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "render new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assign new Task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET show" do
    let(:task) { FactoryBot.create(:task) }

    it "render show template" do
      get :show, params: { id: task.id }
      expect(response).to render_template(:show)
    end

    it "assign reqested task to @task" do
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST create" do
    context "valid data" do
      it "redirect to task#show" do
        post :create, params: { task: attributes_for(:task) }
        expect(response).to redirect_to(task_path(assigns[:task]))
      end

      it "create new task in database" do
        expect {
          post :create, params: { task: attributes_for(:task) }
        }.to change(Task, :count).by(1)
      end
    end

    context "invalid data" do
      it "render new template" do
        post :create, params: { task: attributes_for(:task, title: '') }
        expect(response).to render_template(:new)
      end

      it "dosent create new task in database" do
        expect {
          post :create, params: { task: attributes_for(:task, title: '') }
        }.not_to change(Task, :count)
      end
    end
  end

  describe "DELETE method" do
    let(:task) { FactoryBot.create(:task) }

    it "redirect to task#index" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_path)
    end

    it "delete task from database" do
      delete :destroy, params: { id: task.id }
      expect(Task.exists?(task.id)).to be_falsy
    end
  end
  
end
