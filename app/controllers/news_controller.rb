class NewsController < ApplicationController
  include LiveNews
  before_filter :authenticate_user!

  def new
   @news = PublishNews.new
  end

  def create
    respond_to do |format|
      if PublishNews.create!(params[:publish_news])
        format.html { redirect_to news_index_path(), notice: "Your News is created, we'll post your news once our admin verify content"  }
      else
        format.html { render action: "new", notice: 'Something went wrong.'  }
      end
    end
  end

  def index
     aajtak = "http://aajtak.intoday.in.feedsportal.com/c/34152/f/618432/index.rss?option=com_rss&feed=RSS1.0&no_html=1&rsspage=home"
     ndtv = "http://www.ndtv.com/video/player/news/video-story/237589"
     aajtak_vedio = "http://aajtak.intoday.in/index.php?option=com_rss&feed=RSS1.0&no_html=1&rsspage=video"
     toi = "http://dynamic.feedsportal.com/pf/555218/http://toi.timesofindia.indiatimes.com/rssfeedstopstories.cms"
     vd = "http://www.ndtv.com/video/player/news/my-son-is-not-a-terrorist-abu-hamzas-mother/237585"
     ibn_image = "http://ibnlive.in.com.feedsportal.com/c/33219/fe.ed/ibnlive.in.com/ibnrss/top.xml"
     begin
       #@latest_blog_posts = RSS::Parser.parse(open(ibn_image).read, false).items #[0...5]
       @latest_blog_posts = LiveNews.new(ibn_image)
       #@latest_blog_posts = news.headlines #(ibn_image)
       puts "----------------------------------------#{@latest_blog_posts.inspect}"
     #rescue
       # Do nothing, just continue.  The view will skip the blog section if the feed is nil.
     #  @latest_blog_posts = nil
     end
  end

  def news_pasre(path)
    return RSS::Parser.parse(open(ibn_image).read, false).items
  end


end
