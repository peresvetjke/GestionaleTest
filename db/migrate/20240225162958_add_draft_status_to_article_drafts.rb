class AddDraftStatusToArticleDrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :article_drafts, :draft_status, :string
  end
end
