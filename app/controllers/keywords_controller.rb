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
    @keywords = Keyword.search(params[:search]).paginate(page: params[:page], per_page: 15)
  end

  def create
    @keyword = Keyword.new(keyword_params)

    if @keyword.save
      redirect_to all_keywords_path
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @keyword.update(keyword_params)
      redirect_to all_keywords_path
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keyword.destroy
    redirect_to all_keywords_path
  end

  def sync_dictionary
    Keyword.import_dictionary
    redirect_to root_path
  end

  private
  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:word, translates_attributes: [:id, :_destroy, :translated, :category, :description, word_class: []])
  end
end
