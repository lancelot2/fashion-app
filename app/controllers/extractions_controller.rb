# frozen_string_literal: true
class ExtractionsController < ApplicationController
  before_action :set_extraction, except: [:create, :index, :new]

  def index # GET /restaurants
    @extractions = Extraction.all
    @extraction = Extraction.new
    @tab = 'extraction'

    # Getting all the extractions names
    @searches = Search.all
    @searches_name = []
    @searches.each do |search|
      @searches_name << search.name
    end

    # Getting all the templates names
    @templates = Template.all
    @templates_name = []
    @templates.each do |template|
      @templates_name << template.name
    end
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @extraction = Extraction.new
  end

  def create        # POST /extractions
    @extraction = Extraction.new(extraction_params)
    @extraction.save
    redirect_to extractions_path
  end

  def edit          # GET /extractions/:id/edit
    @extraction = Extraction.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    @extraction = Extraction.find(params[:id])
    # @category = Category.find_by name: params[:extraction][:category]
    # @extraction.category_id = @category.id
    @extraction.save
    @extraction.update(extraction_params)
    redirect_to extractions_path
  end

  def destroy # DELETE /restaurants/:id
    @extraction = Extraction.find(params[:id])
    @extraction.destroy
    redirect_to extractions_path
  end
end

private

def set_extraction
  @extraction = Extraction.find(params[:id])
end

def extraction_params
  params.require(:extraction).permit(:search_id, :template_id)
end
