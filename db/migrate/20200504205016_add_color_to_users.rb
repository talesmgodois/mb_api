class AddColorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :colot, :string
  end
end
