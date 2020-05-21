class Changetable < ActiveRecord::Migration[5.1]
  def change
  	add_column :shops, :token_set, :json
  end
end
