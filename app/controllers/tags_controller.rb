class TagsController < ApplicationController

  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  
  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)

    respond_to do |format|
      if @tag.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @tag.errors.full_messages, status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @tag.update(tag_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @tag.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tag.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
private
  
  def set_tag
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end

end
