class RemoveTypeToArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    remove_column :article_drafts, :type
  end
end
