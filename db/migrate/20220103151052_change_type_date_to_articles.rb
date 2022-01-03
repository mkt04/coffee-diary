class ChangeTypeDateToArticles < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :date, :date
  end
end
