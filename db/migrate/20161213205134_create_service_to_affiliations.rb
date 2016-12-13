class CreateServiceToAffiliations < ActiveRecord::Migration
  def change
    create_table :service_to_affiliations do |t|
      t.references :service, index: true, foreign_key: true
      t.references :affiliation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
