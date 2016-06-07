class AddUserToTextPosts < ActiveRecord::Migration
  def change
    add_reference :text_posts, :user, index: true
  end
end
