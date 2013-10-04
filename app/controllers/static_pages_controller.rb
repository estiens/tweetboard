require 'twitter_getter'

class StaticPagesController < ApplicationController

  def index
    @students=Student.all
  end

  def refresh
    TwitterGetter::TweetScraper.scrape_tweets
    @students=Student.all
  end

end
