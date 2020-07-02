class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string          :select
      t.references      :category, foreign_key: true
      t.datetime        :date, null: false
      t.integer         :price, null: false
      t.string          :image
      t.text            :memo
      t.references      :user, foreign_key: true
      t.timestamps
    end
  end
end
