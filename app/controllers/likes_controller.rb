class LikesController < ApplicationController
  before_action :find_movierecord

  def create
    @like = @movierecord.likes.new(user_id: current_user.id)
    if @like.save
      redirect_to @movierecord
    else
      redirect_to @movierecord
    end
  end

  def destroy
    if @movierecord.present?
      @like = @movierecord.likes.find_by(user_id: current_user.id)
      if @like&.destroy
        redirect_to @movierecord
      end
    end
  end

  private

  def find_movierecord
    @movierecord = Movierecord.find(params[:movierecord_id])
  end
end