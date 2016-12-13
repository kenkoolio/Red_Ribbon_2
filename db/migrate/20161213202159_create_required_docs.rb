class CreateRequiredDocs < ActiveRecord::Migration
  def change
    create_table :required_docs do |t|
      t.string :name
      t.text :description
      t.text :document

      t.timestamps null: false
    end
  end
end
