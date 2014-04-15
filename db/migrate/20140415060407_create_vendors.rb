class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :company
      t.string :website
      t.integer :no_of_employees
      t.integer :year_of_founding
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.integer :phone
      t.string :logo
      t.string :git_link

      t.timestamps
    end
  end
end
