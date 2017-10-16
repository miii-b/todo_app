require 'rails_helper'

describe TagsController, type: :controller do

  before(:each) do
    create :tag
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

  it "create new tag" do
    post :create, "tag": {"name": "my new tag"}, :format => 'js'
    expect(Tag.last.name).to eq 'my new tag'
  end

  it "update tag" do
    expect(Tag.first.name).to eq 'tag_1'
    post :update, "tag": { "name": "new tag name" }, id: Tag.first.id, format: 'js'  
    expect(Tag.first.name).to eq 'new tag name'
  end

  it "delets tag" do 
    tag = create :tag, name: 'test'
    expect(Tag.all.count).to eq 2
    post :destroy, id: tag.id, :format => 'js'
    expect(Tag.all.count).to eq 1
  end
end
