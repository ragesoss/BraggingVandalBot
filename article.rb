require 'active_record'
require 'activerecord-import'
require 'sqlite3'
require 'logger'
require_relative 'tweet'
require_relative 'twitter_client'

ActiveRecord::Base.logger = Logger.new('debug.log')
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'braggingvandalbot.sqlite3',
  encoding: 'utf8'
)

class Article < ActiveRecord::Base
  #################
  # Class methods #
  #################

  def self.last_tweetable
    tweetable.last
  end

  def self.first_tweetable
    tweetable.first
  end

  def self.tweetable
    where('wp10 < ?', 25)
      .where('average_views > ?', 200)
      .where(tweeted: nil)
  end

  ####################
  # Instance methods #
  ####################
  def tweet
    # make_screenshot
    Tweet.new(tweet_text)
    self.tweeted = true
    save
  end

  def screenshot_path
    "screenshots/#{escaped_title}.png"
  end

  def tweet_text
    title
  end

  private

  def escaped_title
    # CGI.escape will convert spaces to '+' which will break the URL
    CGI.escape(title.tr(' ', '_'))
  end

  def views
    average_views.to_i
  end

  def quality
    wp10.to_i
  end

  def url
    "https://en.wikipedia.org/wiki/#{escaped_title}"
  end

  def mobile_url
    "https://en.m.wikipedia.org/wiki/#{escaped_title}"
  end

  def edit_url
    # Includes the summary preload #FixmeBot, so that edits can be tracked:
    # http://tools.wmflabs.org/hashtags/search/fixmebot
    "https://en.wikipedia.org/wiki/#{escaped_title}?veaction=edit&summary=%23FixmeBot"
  end

  def make_screenshot
    webshot = Webshot::Screenshot.instance
    webshot.capture mobile_url, "public/#{screenshot_path}",
                    width: 800, height: 800, allowed_status_codes: [404]
  end

  def hashtag
    TwitterClient.new.top_hashtag(title)
  end
end
