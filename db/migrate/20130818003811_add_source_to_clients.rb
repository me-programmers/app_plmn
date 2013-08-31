class AddSourceToClients < ActiveRecord::Migration
  def change
    add_column :clients, :source, :string
  end
end
