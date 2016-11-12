# frozen_string_literal: true
class CompaniesController < ApplicationController
  before_action :set_company, except: [:create, :index, :new]

  def index         # GET /restaurants
    @companies = Company.all
    @tab = 'company'
  end

  def show          # GET /restaurants/:id
  end

  def new           # GET /restaurants/new
    @company = Company.new
  end

  def create        # POST /companies
    @company = Company.new(company_params)
    @company.save
    redirect_to companies_path
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
    @company.save
    @company.update(company_params)
    redirect_to companies_path
  end

  def destroy       # DELETE /restaurants/:id
    @company.destroy
    redirect_to companies_path
  end
end

def adding_company_to_user_profile_at_creation
  current_user_domain_name = current_user.email.split('@')[1]
  @companies = Company.all
  @companies.each do |company|
    current_user.company = company if current_user_domain_name == company.domain_name
  end
  current_user.save
end

private

def set_company
  @company = Company.find(params[:id])
end

def company_params
  params.require(:company).permit(:name, :retailer, :supplier, :logo, :description)
end
