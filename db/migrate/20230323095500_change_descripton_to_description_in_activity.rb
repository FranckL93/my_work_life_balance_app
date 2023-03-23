class ChangeDescriptonToDescriptionInActivity < ActiveRecord::Migration[7.0]
  def change
    rename_column :activities, :descripton, :description
  end
end
