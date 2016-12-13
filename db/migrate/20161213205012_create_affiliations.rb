class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
