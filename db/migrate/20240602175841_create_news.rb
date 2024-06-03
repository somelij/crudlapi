class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :desc
      t.string :image_url
      t.boolean :hidden

      t.timestamps
    end
  end
end
