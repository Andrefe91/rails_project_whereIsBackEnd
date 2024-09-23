class CreateAttempts < ActiveRecord::Migration[7.2]
  def change
    create_table :attempts do |t|
      t.string :identifier, limit: 10
      t.boolean :resolved

      t.timestamps
    end
    add_index :attempts, :identifier, unique: true
  end
end
