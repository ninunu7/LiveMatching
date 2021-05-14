class Blog < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  has_many :blog_images, dependent: :destroy
  accepts_attachments_for :blog_images, attachment: :blog_image
  has_many :blog_comments, dependent: :destroy
end
