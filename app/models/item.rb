class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :area
  belongs_to :number_of_day
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image,            presence: true
  validates :name,             presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id,        presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :postage_id,       presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :area_id,          presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :number_of_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
