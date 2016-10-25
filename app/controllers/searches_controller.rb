class SearchesController < ApplicationController
  before_action :set_search, except: [:create, :index, :new]

  def index         # GET /restaurants
    @searches = Search.all
    @tab = "search"
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @search = Search.new
  end

  def create        # POST /searches
    @search = Search.new(search_params)
    @search.save
    redirect_to searches_path
  end

  def create_search(name)        # POST /searches
    @search = Search.new
    @search.name = name
    @search.save
    redirect_to searches_path
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
  end
end

private

  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name, :name_filter, :brand_filter, :collection_filter, :gender_filter, :category_1_filter, :category_2_filter, :category_3_filter)
  end
