class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :tribe
      t.text :quote

      t.timestamps
    end
  end
end
