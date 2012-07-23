require "rss"

module News

  class News

    def initialize(path)
      news_parse = RSS::Parser.parse(open(path).read, false).items
      news = {}
      headlines = []
      news_desc = []
      published_on = []

      news_parse.each do |post|
        if post.nil? && post.respond_to?(:pubDate)
          headlines << post.title
          news_desc << post.description
          published_on << post.pubDate
          #create hash object
          news[:headlines]    = headlines
          news[:description]  = news_desc
          news[:published_on] = published_on
        end
      end

      puts "============================#{news}"
      return news
    end

    def headlines
      news = {}
      headlines = []
      news_desc = []
      published_on = []
      
      self.each do |post|
        if post.nil? && post.respond_to?(:pubDate)          
          headlines << post.title
          news_desc << post.description
          published_on << post.pubDate
          #create hash object
          news[:headlines]    = headlines
          news[:description]  = news_desc
          news[:published_on] = published_on
        end
      end

      return news
    end

  end

end