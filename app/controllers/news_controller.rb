class NewsController < ApplicationController
  include LiveNews
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
   @news = PublishNews.new
  end

  def create
    respond_to do |format|
      if PublishNews.create!(params[:publish_news].merge!(:is_live => 1))
        format.html { redirect_to news_index_path(), notice: "Your News is created, we'll post your news once our admin verify content"  }
      else
        format.html { render action: "new", notice: 'Something went wrong.'  }
      end
    end
  end

  def index
      @news = PublishNews.all
      
     aajtak = "http://aajtak.intoday.in.feedsportal.com/c/34152/f/618432/index.rss?option=com_rss&feed=RSS1.0&no_html=1&rsspage=home"
     ndtv = "http://www.ndtv.com/video/player/news/video-story/237589"
     aajtak_vedio = "http://aajtak.intoday.in/index.php?option=com_rss&feed=RSS1.0&no_html=1&rsspage=video"
     toi = "http://dynamic.feedsportal.com/pf/555218/http://toi.timesofindia.indiatimes.com/rssfeedstopstories.cms"
     vd = "http://www.ndtv.com/video/player/news/my-son-is-not-a-terrorist-abu-hamzas-mother/237585"
     ibn_image = "http://ibnlive.in.com.feedsportal.com/c/33219/fe.ed/ibnlive.in.com/ibnrss/top.xml"
     begin
       #@latest_blog_posts = RSS::Parser.parse(open(ibn_image).read, false).items #[0...5]
       #@latest_blog_posts = LiveNews.new(ibn_image)
       #@latest_blog_posts = LiveNews.new #(ibn_image)
       puts "----------------------------------------#{@latest_blog_posts.inspect}"
     #rescue
       # Do nothing, just continue.  The view will skip the blog section if the feed is nil.
     #  @latest_blog_posts = nil
     end
  end

  def show
    @news = PublishNews.find(params[:id])
  end

  def news_pasre(path)
    return RSS::Parser.parse(open(ibn_image).read, false).items
  end

  #like a news
  def like
    news_id = PublishNews.find_by_id(params[:id].to_i)
    #check if user s logged in or a news id is a valid news
    if(!signed_in? || news_id.nil?)
      render :text => false
      return
    end
    if UserLikeNews.where(:user_id => current_user.id, :publish_news_id => news_id.id).empty?
      UserLikeNews.create!(:user_id => current_user.id, :publish_news_id => news_id.id)
    end
    render :text => true
    return
  end

end
=begin

<div class="news" style="min-height: 600px; border: 1px solid red;">


  <h1>Simple Blog Feed</h1>
  <% unless @latest_blog_posts.nil? %>
    The latest <%= pluralize(@latest_blog_posts.count, "post") %> from the blog.
    <ul>
      <% @latest_blog_posts.each do |post| %>
        <% if nil != post && post.respond_to?(:pubDate) %>
          <li>
            <%= link_to post.title, post.link, :target => "_blank" %><br/>
            <%= post.description.html_safe %><br/>
            (<%= time_ago_in_words(post.pubDate) %> ago via blog feed)
          </li>
        <% end %>
      <% end %>
    </ul>
  <% else %>
    <p>
      <em>No blog posts to show.</em>
    </p>
  <% end %>
</div>
=end