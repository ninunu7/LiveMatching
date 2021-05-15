class BlogComment < ApplicationRecord
  belongs_to :customer
  belongs_to :blog
end
