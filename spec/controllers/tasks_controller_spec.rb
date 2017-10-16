require 'rails_helper'

describe TasksController, type: :controller do

  before(:each) do
    @task = create :task
  end

  describe 'GET index' do
    it 'responds with status ok' do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders :index view" do
      get :index
      expect(response).to(render_template :index)
    end
  end

  it "create new task" do
    post :create, "task": {"name": "my new task"}, :format => 'js'
    expect(Task.last.name).to eq 'my new task'
  end

  it "update task" do
    put :update, id: @task.id, task: {name: "new task name"}, :format => 'js'
    @task.reload
    expect(@task.name).to eq 'new task name'
  end

  it "assigned tag to the task" do 
    tag = create :tag
    @task.tags << tag
    expect(@task.tags.first.name).to eq tag.name
  end

  it "delets task" do 
    task = create :task, name: 'test'
    expect(Task.count).to eq 2
    post :destroy, id: task.id, :format => 'js'
    expect(Task.count).to eq 1
  end
end
