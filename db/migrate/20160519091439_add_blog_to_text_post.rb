class AddBlogToTextPost < ActiveRecord::Migration
  def change
    add_column :text_posts, :blog, :text
  end
end
