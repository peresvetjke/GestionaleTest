class AddArticleLooseReferenceToArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :article_drafts, :article_id, :integer
  end
end
