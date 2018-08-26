class CreateCompanyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :company_contacts do |t|
      t.string :full_name
      t.string :position
      t.string :email
      t.references :company, foreign_key: true
      t.timestamps null: false
    end
  end
end
