class CreateServiceToDocs < ActiveRecord::Migration
  def change
    create_table :service_to_docs do |t|
      t.references :service, index: true, foreign_key: true
      t.references :required_doc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
