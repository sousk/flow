class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.string :slug
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
