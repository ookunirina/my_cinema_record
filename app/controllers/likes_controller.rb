class LikesController < ApplicationController
  def create
    @movierecord = Movierecord.find(params[:movierecord_id])
    current_user.like(@movierecord)
  end

  def destroy
    @movierecord = current_user.likes.find(params[:id]).movierecord
    current_user.unlike(@movierecord)
  end
end