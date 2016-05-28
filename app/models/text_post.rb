class TextPost < ActiveRecord::Base
  scope :recent, lambda { order('created_at DESC').limit(5) }
  validates_presence_of :url
  validates_presence_of :title
  validates_presence_of :blog
  belongs_to :user





  # Set up this side of the polymorphic association
  has_many :likes, as: :likeable
end
