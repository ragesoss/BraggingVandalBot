require 'wikipedia_twitterbot'
require_relative 'brags'

Article.connect_to_database 'braggingvandalbot'

class BraggingVandalBot
  def tweet(article)
    brag = Brags.new(article).random
    tweet_text = "#{brag} #{article.hashtag}"
    article.tweet tweet_text
  end

  def self.find_articles
    puts "finding articles..."
    # options = {
    #   redirects: false,
    #   disambiguation: false,
    #   min_daily_pageviews: 300,
    #   max_wp10_score: 30,
    #   count: 10000,
    #   namespaces: [0]
    # }

    options = {
      max_w10: 30,
      min_views: 300
    }
    Article.import_at_random(options)
  end
end
