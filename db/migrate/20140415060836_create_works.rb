class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :vendor, index: true
      t.string :screen_shot
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
