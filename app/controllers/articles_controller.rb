class ArticlesController < ApplicationController
  before_action :_set_article, only: %i[ show edit update destroy ]

  # GET /articles
  def index
    #TODO::検索機能実装時にmodelに移すこと
    @articles = Article.order(date: "DESC")
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(_article_params)

    if @article.save
      redirect_to article_url(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(_article_params)
      redirect_to article_url(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy

    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def _set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def _article_params
      params.require(:article).permit(:date, :shop_name, :bean_name, :producing_area, :particle_size, :memo, :want_to_again, photos: [])
    end
end
