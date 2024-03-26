class AddTypeToArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :article_drafts, :type, :string
  end
end
