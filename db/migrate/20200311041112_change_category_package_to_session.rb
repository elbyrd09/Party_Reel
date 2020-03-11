class ChangeCategoryPackageToSession < ActiveRecord::Migration[5.2]
  def change
    rename_column :packages, :category, :session
  end
end
