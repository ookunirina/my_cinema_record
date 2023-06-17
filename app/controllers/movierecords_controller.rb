class MovierecordsController < ApplicationController
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

  private

  def movierecord_params
    params.require(:movierecord).permit(:title, :image_url, :genre, :star, :review)
  end
end
