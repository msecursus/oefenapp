class PagesController < ApplicationController
  def index
    @articles = Article.last (5)
    @recipes = Recipe.last (5)
    
  end
  def fast
  end
  def slow
  end
end
