class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :municipality, :street_number, :building_name, :telephone_number,
                :order_id, :token

  validates :zip_code,         presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :area_id,          presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :municipality,     presence: true
  validates :street_number,    presence: true
  validates :telephone_number, presence: true, format: { with: /\A[0-9]{10,11}\z/ }
  validates :user_id,          presence: true
  validates :item_id,          presence: true
  validates :token,            presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(zip_code: zip_code, area_id: area_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
