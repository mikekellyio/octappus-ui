class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps null: false
    end
    
    change_table(:children) do |t|
      t.belongs_to :team, index: true, foreign_key: true
    end
  end
end
