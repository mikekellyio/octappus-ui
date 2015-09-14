class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.belongs_to :step

      t.timestamps null: false
    end
  end
end
