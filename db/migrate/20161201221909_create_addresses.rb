class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :apt
      t.string :street
      t.string :city
      t.references :state, index: true, foreign_key: true
      t.references :zip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
