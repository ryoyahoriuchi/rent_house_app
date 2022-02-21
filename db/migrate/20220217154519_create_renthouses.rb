class CreateRenthouses < ActiveRecord::Migration[6.0]
  def change
    create_table :renthouses do |t|
      t.string :name
      t.string :rent
      t.string :address
      t.string :age
      t.text :remarks
    end
  end
end
