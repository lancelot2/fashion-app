# frozen_string_literal: true
class SearchesController < ApplicationController
  before_action :set_search, except: [:create, :index, :new]
  before_action :display_subnavbar

  def index         # GET /restaurants
    @searches = Search.all
    @tab = 'search'
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @search = Search.new
  end

  def create        # POST /searches
    @search = Search.new(search_params)
    @search.user = current_user
    @search.save
    redirect_to searches_path
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
  end

  private

  def display_subnavbar
    @display_subnavbar = true
  end

  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name, :url)
  end
end
