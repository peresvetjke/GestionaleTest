class CreateArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :article_drafts do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
