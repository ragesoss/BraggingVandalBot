class BraggingVandalBot
  def tweet(article)
    brag = Brags.new(article).random
    tweet_text = "#{brag} #{article.hashtag}"
    article.tweet tweet_text
  end

  def self.find_articles
    puts "finding articles..."
    options = {
      redirects: false,
      disambiguation: false,
      min_daily_pageviews: 300,
      max_wp10_score: 30,
      count: 10000,
      namespaces: [0]
    }
    Article.import_at_random(options)
    Article.fetch_at_random
    # puts "#{articles.count} mainspace articles found"
    # articles = DiscardRedirects.from(articles)
    # puts "#{articles.count} are not redirects"
    # articles = HighPageviews.from_among(articles, min_views: 300)
    # puts "#{articles.count} of those have high page views"
    # articles = Ores.discard_high_revision_scores(articles, max_wp10: 30)
    # puts "#{articles.count} of those have low revision scores"
    # articles = CategoryFilter.discard_disambiguation_pages(articles)
    # puts "#{articles.count} of those are not disambiguation pages"
    # if articles.count > 0
    #   puts "#{articles.count} tweetable prospect(s) found!"
    # else
    #   puts "no tweetable articles found in that cycle"
    # end
    # Article.import articles
  end
end
