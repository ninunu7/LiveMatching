class Event < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
  has_many :comments, dependent: :destroy
  validates :artist_name, presence: true, length: { maximum: 30}
  validates :message, presence: true
  validates :start_time, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?

    artist_name_like(search_params[:artist_name])
      .start_time_from(search_params[:start_time_from], search_params[:start_time_to])
      .start_time_to(search_params[:start_time_to], search_params[:start_time_from])
      .message_like(search_params[:message])
  end

  scope :artist_name_like, -> (artist_name) { where('artist_name LIKE ?', "%#{artist_name}%") }
  scope :start_time_from, -> (from, to) {
    if from != ""
      param = DateTime.parse(from + " 00:00:00") - 9.hour

      if to == ""
        where('? = start_time', param)
      else
        where('? <= start_time', param)
      end
    end

  }
  #scope :start_time_from, -> (from) { where('? <= start_time', from) if from.present? }にした場合検索フォームに値がない時実行されない
  #if 引数.present?
  scope :start_time_to, -> (to, from) {
    if to != ""
      param = DateTime.parse(to + " 00:00:00") - 9.hour
      if from == ""
        where('? = start_time',param)
      else
        where('start_time <= ?', param)
      end
    end
  }
  scope :message_like, -> (message) { where('message LIKE ?', "%#{message}%") }
  #scope :メソッド名 -> (引数) { SQL文 }
end
