class CreateAssociatedSteps < ActiveRecord::Migration
  def change
    create_table :associated_steps do |t|
      t.belongs_to :child, index: true, foreign_key: true
      t.belongs_to :step, index: true, foreign_key: true
      t.datetime :award_received_at

      t.timestamps null: false
    end
  end
end
