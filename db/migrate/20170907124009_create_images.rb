class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
