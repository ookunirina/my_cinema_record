class MovierecordsController < ApplicationController
  def index
    @movierecords = Movierecord.where.not(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end
end
