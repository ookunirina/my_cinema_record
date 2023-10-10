class Admin::MovierecordsController < Admin::BaseController
    before_action :set_movierecord, only: %i[show edit update destroy]

  def index
    @tag_list = Tag.all
    @q  = Movierecord.ransack(params[:q])
    @movierecords = @q .result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show; end
  
  def edit; end

  def update
    tag_list = params[:movierecord][:tag].split(',').map(&:strip).uniq
    if @movierecord.update(movierecord_params)
       @movierecord.save_with_tags(tag_names: tag_list)
      redirect_to admin_movierecord_path(@movierecord), success: t('defaults.message.updated')
    else
      flash.now[:danger] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movierecord.destroy!
    redirect_to admin_movierecords_path, success: t('defaults.message.deleted')
  end

  private

  def set_movierecord
    @movierecord = Movierecord.find(params[:id])
  end

  def movierecord_params
    params.require(:movierecord).permit(:title, :image_url, :image_url_cache, :viewing_style, :star, :review)
  end
end