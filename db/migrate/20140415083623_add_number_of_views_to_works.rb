class AddNumberOfViewsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :number_of_views, :integer, default: 0
  end
end
