class ArticleDraft < ApplicationRecord
  enum draft_type: { create: "create", update: "update", delete: "delete" }, _prefix: :draft
  enum draft_status: { pending: "pending", ready: "ready", applied: "applied" }, _prefix: :draft

  after_save :apply_draft

  private
  def apply_draft
    return unless draft_ready?
    case draft_type
    when "create"
      @article = Article.new(name: name, description: description, price: price)
      @article.save
    when "update"
      if article_id? == nil
        raise "should be present"
      end
      @article = Article.find(article_id)
      @article.update(name: name, description: description, price: price)
    when "delete"
      if article_id? == nil
        raise "should be present"
      end
      @article = Article.find(article_id)
      @article.destroy
    else
      raise "Not supported"
    end
    draft_applied!
  end
end
