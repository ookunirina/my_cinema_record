class RecommendedController < ApplicationController
  def index
    tag = Tag.find_by(name: 'オススメ')
    if tag
      @recommended_movierecords = Movierecord.joins(:tags).where(tags: { id: tag.id }).where.not(user_id: current_user.id).order("RANDOM()").limit(3)
    else
      # タグが見つからなかった場合の処理を記述
      @recommended_movierecords = []
    end
  end
end