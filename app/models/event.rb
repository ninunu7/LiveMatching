class Event < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  has_many :comments, dependent: :destroy
  validates :artist_name, presence: true, length: { maximum: 30}
  validates :message, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?

    artist_name_like(search_params[:artist_name])
      .start_time_from(search_params[:start_time_from])
      .start_time_to(search_params[:start_time_to])
      .message_like(search_params[:message])
  end

  scope :artist_name_like, -> (artist_name) { where('artist_name LIKE ?', "%#{artist_name}%") }
  scope :start_time_from, -> (from) { where('? <= start_time', from) }
  #scope :join_day_from, -> (from) { where('? <= join_day', from) if from.present? }にすると検索フォームに値がない場合実行されない
  #if 引数.present?
  scope :start_time_to, -> (to) { where('start_time <= ?', to) }
  scope :message_like, -> (message) { where('message LIKE ?', "%#{message}%") }
  #scope :メソッド名 -> (引数) { SQL文 }
end
