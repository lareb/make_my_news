module NewsHelper
  def not_like_yet?(news)
    UserLikeNews.where(:user_id => current_user.id, :publish_news_id => news).empty?
  end

end
