class ArticlesController < ApplicationController
  before_action :_set_article, only: %i[ show edit update destroy ]

  # GET /articles
  def index
    # NOTE::スマートにまとめたい場合はform modelの作成を検討する事
    @articles = Article.order(date: "DESC")
    @articles = @articles.where("bean_name LIKE ?", "%#{params[:bean_name]}%") if params[:bean_name].present?
    @articles = @articles.where('date >= ?', params[:start_date]) if params[:start_date].present?
    @articles = @articles.where('date <= ?', params[:end_date]) if params[:end_date].present?
    @articles = @articles.where("shop_name LIKE ?", "%#{params[:shop_name]}%") if params[:shop_name].present?
    if params[:producing_area].present?
      @articles = @articles.where("producing_area LIKE ?", "%#{params[:producing_area]}%")
    end
    @articles = @articles.where(particle_size: params[:particle_size]) if params[:particle_size].present?
    @articles = @articles.where(want_to_again: params[:want_to_again]) if params[:want_to_again] == "true"
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
      redirect_to article_url(@article), notice: "日記を記入しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(_article_params)
      render :show, status: :ok, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy

    redirect_to articles_url, notice: "日記を削除しました"
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
