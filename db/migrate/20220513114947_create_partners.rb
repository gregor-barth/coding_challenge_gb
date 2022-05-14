class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :experience, array: true, :default => []
      t.decimal :lon, {:precision=>10, :scale=>6}
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.integer :operating_radius, :default => 0
      t.integer :rating, :default => 0

      t.timestamps
    end
  end
end
