class MovierecordsController < ApplicationController
  before_action :set_movierecord, only: [:edit, :update, :destroy]

  def index
    @movierecords = Movierecord.all.includes(:user).order(created_at: :desc)
    #@movierecords = Movierecord.where.not(user_id: current_user.id).includes(:user).order(created_at: :desc) ユーザー以外のみ表示
  end

  def new
    @movierecord = Movierecord.new
  end

  def create
    @movierecord = current_user.movierecords.build(movierecord_params)
    if @movierecord.save
      redirect_to movierecords_path, success: t('movierecords.create.success')
    else
      flash.now['danger'] = t('movierecords.create.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movierecord = Movierecord.find(params[:id])
  end

  def edit
    @movierecord = current_user.movierecords.find(params[:id])
  end

  def update
    @movierecord = current_user.movierecords.find(params[:id])
    if @movierecord.update(movierecord_params)
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

  private

  def movierecord_params
    params.require(:movierecord).permit(:title, :image_url, :image_url_cache, :genre, :star, :review)
  end

  def set_movierecord
    @movierecord = current_user.movierecords.find(params[:id])
  end
end
