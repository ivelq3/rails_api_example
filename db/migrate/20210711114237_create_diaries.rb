class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title
      t.integer :kind, default: 0
      t.datetime :expiration

      t.timestamps
    end
  end
end
