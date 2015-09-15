class ChangeStepFields < ActiveRecord::Migration
  def change
    rename_column :steps, :name, :title
    rename_column :steps, :description, :content
  end
end
