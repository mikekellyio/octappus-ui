class AddAwardsChildren < ActiveRecord::Migration
  def change
    create_table :awards_children do |t|
      t.belongs_to :child, index: true, foreign_key: true
      t.belongs_to :award, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
