class AddDraftTypeToArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :article_drafts, :draft_type, :string
  end
end
