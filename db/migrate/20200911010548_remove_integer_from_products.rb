class RemoveIntegerFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :integer, :string
  end
end
