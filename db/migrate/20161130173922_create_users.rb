class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :alias
      t.references :address, index: true, foreign_key: true
      t.integer :user_level

      t.timestamps null: false
    end
  end
end
