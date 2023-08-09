class RankingsController < ApplicationController
  def index
    @user_movierecord_ranks = User.joins(:movierecords)
                                   .group('users.id')
                                   .order('COUNT(movierecords.user_id) DESC')
                                   .select('users.*, COUNT(movierecords.user_id) AS movierecords_count')
  end
end
