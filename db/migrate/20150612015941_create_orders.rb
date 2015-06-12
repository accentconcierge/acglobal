class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :service
      t.string :charge

      t.timestamps null: false
    end
  end
end
