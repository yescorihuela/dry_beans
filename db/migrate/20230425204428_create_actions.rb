class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :trip, foreign_key: true, on_delete: :cascade
      t.string :operation
      t.string :address
      t.text :comments
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end