class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.datetime :date
      t.string :shop_name
      t.string :bean_name
      t.string :producing_area
      t.float :particle_size
      t.text :memo
      t.boolean :want_to_again

      t.timestamps
    end
  end
end
