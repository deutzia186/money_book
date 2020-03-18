class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.boolean         :select,              null: false
      t.datetime        :date,                null: false
      t.integer         :price,               null: false
      t.string          :image
      t.text            :memo
      t.timestamps
    end
  end
end
