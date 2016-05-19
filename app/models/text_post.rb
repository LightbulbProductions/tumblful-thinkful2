class TextPost < ActiveRecord::Base
  validates_presence_of :url, :title, :blog
  scope :recent, lambda { order('created_at DESC').limit(50) }

  belongs_to :user

  # Set up this side of the polymorphic association
  has_many :likes, as: :likeable
end
