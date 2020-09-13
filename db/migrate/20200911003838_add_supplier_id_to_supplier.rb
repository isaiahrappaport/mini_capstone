class AddSupplierIdToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :supplier_id, :integer
  end
end
