class ExtractionsController < ApplicationController
  before_action :set_extraction, except: [:create, :index, :new]

  def index         # GET /restaurants
    @extractions = Extraction.all
    @extraction = Extraction.new
    @tab = "extraction"
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

  def destroy       # DELETE /restaurants/:id
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
    params.require(:extraction).permit(:name, :format, :column_1, :column_2, :column_3)
  end

