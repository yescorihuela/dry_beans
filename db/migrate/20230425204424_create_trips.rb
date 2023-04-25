class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :route, foreign_key: true, on_delete: :cascade
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end