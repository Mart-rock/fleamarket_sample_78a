class ChangeDatatypeCityOfAddreses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :city, :string
  end
end
