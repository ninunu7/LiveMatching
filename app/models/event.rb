class Event < ApplicationRecord
  belongs_to :customer, optional: true #belongs_toの外部キーのnilを許可する
end
