class TemplatesController < ApplicationController
  before_action :set_template, except: [:create, :index, :new]

  def index         # GET /restaurants
    @templates = Template.all
    @template = Template.new
    @tab = "template"
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @template = Template.new
  end

  def create        # POST /templates
    @template = Template.new(template_params)
    @template.save
    redirect_to templates_path
  end

  def edit          # GET /templates/:id/edit
  end

  def update        # PATCH /restaurants/:id
    # @category = Category.find_by name: params[:template][:category]
    # @template.category_id = @category.id
    @template.save
    @template.update(template_params)
    redirect_to templates_path
  end

  def destroy       # DELETE /restaurants/:id
    @template.destroy
    redirect_to templates_path
  end
end



private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, :format, :column_1, :column_2, :column_3)
  end

