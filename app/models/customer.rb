class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20}
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create

  attachment :profile_image
  enum gender: {default: 0, man: 1, woman: 2}

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :blog_images, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationships, source: :followed
  #1行上のhas_many :relationshipsモデルをthroughしてfollowed(_id)カラムを参照(source)する
  #@customer.followingsとcontrollerで記述出来る(フォロー・フォロワー一覧ページ作成)


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

  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

end
