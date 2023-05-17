class KeywordsController < ApplicationController
  def index

  end

  def new
    @keyword = Keyword.new
  end
end
