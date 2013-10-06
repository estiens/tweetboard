module TwitterGetter

  class ConfigurationTasks

    def self.configure_twitter

    Twitter.configure do |config|
      config.consumer_key = "EAhY8dHmZgMHrcztSxdg"
      config.consumer_secret = "1ddwMrOiTPAHSMCaUAZMaDUyjvvqIYpEqQlqK8R13c"
      config.oauth_token = "15913837-Iy0DKKHbwqlq3hFk0z660nd6gyz8Zsu0XCCMpLLEv"
      config.oauth_token_secret = "1ccl3H19nwFuZCYLbN2c74OWggw8LeW1iLSpeS4563g"
      end
    end
  end

class StudentTwitter

  def self.scrape_user_names
    Student.all.each do |student|
    user=Twitter.user(student.twitter_handle)
    student.username=user.name
    student.tagline=user.description
    student.save
    end
  end

  def self.make_users
    ConfigurationTasks.configure_twitter
    scrape_user_names
  end

end

class TweetScraper

  def self.scrape_tweets_for_user(student)
    Twitter.user_timeline(student.twitter_handle).each do |studenttweet|
      tweet=student.tweets.new
      tweet.text=studenttweet.text
      tweet.save
      end
  end
  
  def self.scrape_tweets_for_each_user
    @students=Student.all
    @students.each do |student|
      scrape_tweets_for_user(student)
    end
  end

  def self.scrape_tweets
    ConfigurationTasks.configure_twitter
    scrape_tweets_for_each_user
  end

end

end