class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :identifier, unique: true, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :users, :identifier
  end
end
