class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :categories, :name, :title
  end
end
