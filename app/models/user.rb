class User < ActiveRecord::Base
  attr_accessible :email, :facebook_access_token
  
  has_many :posts
end
