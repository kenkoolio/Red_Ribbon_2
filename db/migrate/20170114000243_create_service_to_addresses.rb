class CreateServiceToAddresses < ActiveRecord::Migration
  def change
    create_table :service_to_addresses do |t|
      t.references :service, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
