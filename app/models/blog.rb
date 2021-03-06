class Blog < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  has_many :blog_images, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

    def favorited_by?(customer)
      favorites.where(customer_id: customer.id).exists?
    end

  accepts_attachments_for :blog_images, attachment: :image
  validates :blog_title, presence: true, length: { maximum: 50 }
  validates :blog_text, presence: true

end
