class RemoveSupplierIdFromSuppliers < ActiveRecord::Migration[6.0]
  def change
    remove_column :suppliers, :supplier_id, :integer
  end
end
