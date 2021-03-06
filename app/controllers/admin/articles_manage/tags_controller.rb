class Admin::ArticlesManage::TagsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @tags = Tags::MarkArticle.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @tags =  Tags::MarkArticle.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@tags.current_page - 1)*LIST_PAGE + 1
  end

  def new
    @tag = Tags::MarkArticle.new
  end

  def create
    @tag = Tags::MarkArticle.new(tag_params)
    if @tag.save
      redirect_to admin_articles_manage_tags_path
      flash[:success] = "新增标签成功"
    else
      render :new
      flash[:error] = @tag.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @tag.attributes = tag_params
    if @tag.save
      redirect_to admin_articles_manage_tags_path
      flash[:success] = "更新标签成功"
    else
      render :edit
      flash[:error] = @tag.errors.full_messages.join(",")
    end
  end

  def destroy
    if @tag.update(status:-1)
      redirect_to admin_articles_manage_tags_path
      flash[:success] = "删除标签成功"
    else
      flash[:error] = @tag.errors.full_messages.join(",")
    end
  end

  private

    def find_one
      @tag = Tags::MarkArticle.find_by_id(params[:id])
    end

    def tag_params
      params.require(:tags_mark_article).permit!
    end
end
