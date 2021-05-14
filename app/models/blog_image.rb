class BlogImage < ApplicationRecord
  belongs_to :customer
  belongs_to :blog
  attachment :blog_image
end
