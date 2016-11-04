class AddEmailDomainToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :email_domain, :string
  end
end
