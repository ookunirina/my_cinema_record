class MovierecordsController < ApplicationController
  before_action :set_movierecord, only: [:edit, :update, :destroy]

  def index
    @tag_list = Tag.all
    @q = Movierecord.ransack(params[:q])
    @movierecords = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @movierecord = Movierecord.new
  end

  def create
    @movierecord = current_user.movierecords.build(movierecord_params)
    tag_names = params.dig(:movierecord, :tag).split(',').map(&:strip).uniq
    if @movierecord.save
      @movierecord.save_with_tags(tag_names: tag_names)
      redirect_to movierecords_path, success: t('movierecords.create.success')
    else
      flash.now['danger'] = t('movierecords.create.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movierecord = Movierecord.find(params[:id])
    @movierecord.tags = @movierecord.tags
  end

  def edit
    @movierecord = current_user.movierecords.find(params[:id])
    @tag_list = @movierecord.tags.pluck(:name).join(',')
  end

  def update
    @movierecord = current_user.movierecords.find(params[:id])
    tag_list = params[:movierecord][:tag].split(',').map(&:strip).uniq
    if @movierecord.update(movierecord_params)
      @movierecord.save_with_tags(tag_names: tag_list)
      redirect_to @movierecord, success: t('defaults.message.updated')
    else
      flash.now['danger'] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movierecord.destroy!
    redirect_to movierecords_path, success: t('defaults.message.deleted')
  end

  def likes
    @q = current_user.like_movierecords.ransack(params[:q])
    @like_movierecords = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @movierecords = @tag.movierecords.all
  end

  private

  def movierecord_params
    params.require(:movierecord).permit(:title, :image_url, :image_url_cache, :viewing_style, :star, :review)
  end

  def set_movierecord
    @movierecord = current_user.movierecords.find(params[:id])
  end
end
