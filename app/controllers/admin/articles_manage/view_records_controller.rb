class Admin::ArticlesManage::ViewRecordsController < Admin::BaseController
  before_action :find_one, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
      @view_records = ViewRecords::MarkArticle.where("title like ?", "%#{params[:keyword]}%").order("created_at desc").page(params[:page]).per(LIST_PAGE)
    else
      @view_records =  ViewRecords::MarkArticle.order("created_at desc").page(params[:page]).per(LIST_PAGE)
    end
    @begin_count = (@view_records.current_page - 1)*LIST_PAGE + 1
  end

  def new

  end

  def create
    @view_record = ViewRecords::MarkArticle.new(view_record_params)
    if @view_record.save
      redirect_to admin_articles_manage_view_records_path
      flash[:success] = "新增访问记录成功"
    else
      render :new
      flash[:error] = @view_record.errors.full_messages.join(",")
    end
  end

  def edit

  end

  def update
    @view_record.attributes = view_record_params
    if @view_record.save
      redirect_to admin_articles_manage_view_records_path
      flash[:success] = "更新访问记录成功"
    else
      render :edit
      flash[:error] = @view_record.errors.full_messages.join(",")
    end
  end

  def destroy
    if @view_record.update(status:-1)
      redirect_to admin_articles_manage_view_records_path
      flash[:success] = "删除访问记录成功"
    else
      flash[:error] = @view_record.errors.full_messages.join(",")
    end
  end

  private

    def find_one
      @view_record = ViewRecords::MarkArticle.find_by_id(params[:id])
    end

    def view_record_params
      params.require(:view_record_mark_article).permit!
    end
end
