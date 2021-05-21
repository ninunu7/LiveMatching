class BlogImage < ApplicationRecord
  #belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  belongs_to :blog, optional: true #belongs_toの外部キーのnilを許可する
  attachment :image

end
