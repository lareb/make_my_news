class UserLikeNewsController < ApplicationController
  before_filter :authenticate_user!
  
  def like
    news_id = PublishNews.find_by_id(params[:news_id].to_i)
    #check if user s logged in or a news id is a valid news
    if(!signed_in? || news_id.nil?)
      render :text => false
    end
    UserLikeNews.like(user_id, news_id)
    render :text => true
  end

end
