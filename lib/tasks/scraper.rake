require 'twitter'
require 'twitter_getter'

# CURRENT_STUDENTS=["bitmakerlabs", "ahmednadar","kim_yee","brianhan87","deepak23verma", "jcarrharris", "Royal_Arse", "chai_shah", "mutualarising", "szuturon", "omarkhafagy", "bmhawkeswood", "northofnormal"]

namespace :data do
  desc "Scrape Users to Database"
  task :scrape_users => :environment do
    TwitterGetter::StudentTwitter.make_users
  end
  desc "Scrape Tweets to Database"
  task :scrape_tweets => :environment do
    TwitterGetter::TweetScraper.scrape_tweets
  end
end

# class ConfigurationTasks

#   def self.configure_twitter

#     Twitter.configure do |config|
#       config.consumer_key = "EAhY8dHmZgMHrcztSxdg"
#       config.consumer_secret = "1ddwMrOiTPAHSMCaUAZMaDUyjvvqIYpEqQlqK8R13c"
#       config.oauth_token = "15913837-Iy0DKKHbwqlq3hFk0z660nd6gyz8Zsu0XCCMpLLEv"
#       config.oauth_token_secret = "1ccl3H19nwFuZCYLbN2c74OWggw8LeW1iLSpeS4563g"
#     end
#   end
# end

# class UserScraper

#   def self.scrape_user_names
#     CURRENT_STUDENTS.each do |x|
#     user=Twitter.user(x)
#     student=Student.new
#     student.username=user.name
#     student.tagline=user.description
#     student.twitter_handle=x
#     student.save
#     end
#   end

#   def self.scrape_users
#     ConfigurationTasks.configure_twitter
#     scrape_user_names
#   end

# end

# class TweetScraper
  
#   def self.scrape_tweets_for_each_user
#     @students=Student.all
#     @students.each do |student|
#       student_tweet_array=Twitter.user_timeline(student.twitter_handle)
#       student_tweet_array.each do |studenttweet|
#         tweet=student.tweets.new
#         tweet.text=studenttweet.text
#         tweet.save
#         end
#     end
#   end

#   def self.scrape_tweets
#     ConfigurationTasks.configure_twitter
#     scrape_tweets_for_each_user
#   end

# end




