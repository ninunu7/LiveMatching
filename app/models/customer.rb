class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create

  attachment :profile_image
  enum gender: {man: 0, woman: 1,unknown: 2}

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :blog_images, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy

  def active_for_authentication?
    super && (self.user_status == true)
  end

  #パスワード入力無しでマイページ編集する為
  def update_without_current_password(params,*options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params,*options)
    clean_up_passwords
    result
  end
mount_uploader :profile_image, ProfileimageUploader
end
