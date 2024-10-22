class Livehouse < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :address }
  validates :address, presence: true
end
