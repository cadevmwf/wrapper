class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :share_time
      t.integer  :user_id
      t.string   :source
      t.string   :source_post_id
      t.string   :source_poster_name
      t.string   :source_poster_id
      t.text     :source_post_details
      t.string   :source_post_type
      t.string   :source_post_link
      t.timestamps
    end
  end
end