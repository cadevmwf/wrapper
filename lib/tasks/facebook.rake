require 'open-uri'

namespace :sources do
  desc "Poll Facebook for users' home feeds"
  task :facebook => :environment do
    uri = "https://graph.facebook.com/me/home?limit=200"
    posts_added = 0
    User.find_each do |user|
      response = open(uri + "&access_token=" + user.facebook_access_token).read
      posts = JSON.parse(response)['data']
      posts_added += posts.inject(0) do |counter, post|
        p = user.posts.build
        p.share_time = post['created_time']
        p.source = 'Facebook'
        p.source_post_id = post['id']
        p.source_poster_name = post['from'].try(:[], 'name')
        p.source_poster_id = post['from'].try(:[], 'id')
        p.source_post_details = post['message']
        p.source_post_type = post['type']
        p.source_post_link = post['link']
        p.save ? counter + 1 : counter
      end
    end
    File.open('facebook_polling_log.txt', 'a+') { |f| f.puts "Polled at #{Time.now}; added #{posts_added} posts." }
  end
end