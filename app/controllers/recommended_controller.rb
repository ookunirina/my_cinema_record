class RecommendedController < ApplicationController
    def index
        tag = Tag.find_by(name: 'オススメ')
        @recommended_movierecords = Movierecord.joins(:tags).where(tags: { id: tag.id }).where.not(user_id: current_user.id).order("RANDOM()").limit(3)
      end
end
