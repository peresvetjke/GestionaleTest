class ArticlesController < ApplicationController

  def index
    @breadcrumbs = ["Articoli"]
    @title = "Articoli"
    @subtitle = "Lista"
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
    @article_draft = ArticleDraft.new(
      name: @article.name,
      description: @article.description,
      price: @article.price,
      draft_type: :update,
      draft_status: :pending,
      article_id: @article.id
    )
    @article_draft.save
    redirect_to edit_article_draft_path(@article_draft)
  end

  def destroy
    @article = Article.find(params[:id])
    @article_draft = ArticleDraft.new(
      name: @article.name,
      description: @article.description,
      price: @article.price,
      draft_type: :delete,
      draft_status: :pending,
      article_id: @article.id
    )
    @article_draft.save
    print(article_draft_path(@article_draft))
    redirect_to article_draft_path(@article_draft), method: :delete
  end
end
