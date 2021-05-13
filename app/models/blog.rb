class Blog < ApplicationRecord
  belongs_to :customer
  has_many :blog_images, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
end
