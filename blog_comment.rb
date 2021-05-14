class BlogComment < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :blog, optional: true
end
