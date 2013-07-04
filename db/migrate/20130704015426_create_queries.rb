class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string   :input
      t.text     :synopsis
      t.string   :interpretation
      t.timestamps
    end
    add_index :queries, :input, unique: true
  end
end
