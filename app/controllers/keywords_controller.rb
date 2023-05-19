class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :destroy, :update]

  def index
    @keywords = Keyword.list(params[:search])
  end

  def new
    @keyword = Keyword.new
  end

  def show

  end

  def edit

  end

  def all
    @keywords = Keyword.all
  end

  def create
    @keyword = Keyword.new(keyword_params)

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @keyword, notice: 'Keyword was successfully created.' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to @keyword, notice: 'Keyword was successfully updated.' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :edit }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keyword.destroy
    redirect_to all_keywords_path
  end

  private
  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:word, translates_attributes: [:id, :_destroy, :translated, :category, :description, word_class: []])
  end
end
