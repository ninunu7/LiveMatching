class Event < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  has_many :comments, dependent: :destroy

  scope :search, -> (search_params) do
    return if search_params.blank?

    artist_name_like(search_params[:artist_name])
      .join_day_from(search_params[:join_day_from])
      .join_day_to(search_params[:join_day_to])
      .message_like(search_params[:message])
  end

  scope :artist_name_like, -> (artist_name) { where('artist_name LIKE ?', "%#{artist_name}%") }
  scope :join_day_from, -> (from) { where('? <= join_day', from) }
  #scope :join_day_from, -> (from) { where('? <= join_day', from) if from.present? }にすると検索フォームに値がない場合実行されない
  #if 引数.present?
  scope :join_day_to, -> (to) { where('join_day <= ?', to) }
  scope :message_like, -> (message) { where('message LIKE ?', "%#{message}%") }
  #scope :メソッド名 -> (引数) { SQL文 }
end
