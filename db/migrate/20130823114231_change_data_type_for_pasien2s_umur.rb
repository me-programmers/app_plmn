class ChangeDataTypeForPasien2sUmur < ActiveRecord::Migration
  def up
  	change_table :pasien2s do |t|
  		t.change :umur, :string
  	end
  end

  def down
  	change_table :pasien2s do |t|
  		t.change :umur, :integer
  	end
  end
end
