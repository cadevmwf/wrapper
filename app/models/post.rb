class Post < ActiveRecord::Base
  belongs_to :user
  
  validates_uniqueness_of :source_post_id
  validate :post_must_contain_video
  validates_presence_of :source_post_link

  def post_must_contain_video
    if self.source_post_type != 'video'
      errors.add(:source_post_type, "doesn't contain a video")
    end
  end
end
