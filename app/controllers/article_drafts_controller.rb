class ArticleDraftsController < ApplicationController
  def new
    @breadcrumbs = []
    @article_draft = ArticleDraft.new
  end

  def create
    @breadcrumbs = []
    @article_draft = ArticleDraft.new(article_params.merge(
      draft_status: :ready,
      draft_type: :create,
    ))
    if @article_draft.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @breadcrumbs = []
    @article_draft = ArticleDraft.find(params[:id])
  end

  def update
    @breadcrumbs = []
    @article_draft = ArticleDraft.find(params[:id])
    if @article_draft.update(article_params.merge(draft_status: :ready))
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article_draft = ArticleDraft.find(params[:id])
    if @article_draft.update(draft_status: :ready)
      redirect_to articles_path
    else
      redirect_to articles_path, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article_draft).permit(:name, :description, :price)
  end
end
