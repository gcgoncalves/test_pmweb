class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :legal_name
      t.string :zip_code
      t.string :address
      t.string :phone
      t.string :company_type

      t.timestamps
    end
  end
end
