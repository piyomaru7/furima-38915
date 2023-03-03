require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)    
    sleep 0.001
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'zip-code,area_id,municipality,street_number,building_name,telephone_numberが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'zip-codeが空では購入できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip-codeが全角では購入できない' do
        @order_address.zip_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'zip-codeが半角でも数値以外では購入できない' do
        @order_address.zip_code = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'zip-codeがハイフンなしでは購入できない' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'zip-codeの先頭が3桁以外では購入できない' do
        @order_address.zip_code = '1234-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'zip-codeのハイフンの後ろが4桁以外では購入できない' do
        @order_address.zip_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid")
      end
      it 'area_idが空では購入できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1では購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_numberが空では購入できない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが全角では購入できない' do
        @order_address.telephone_number = '０８０２２００２２００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角でも数値以外では購入できない' do
        @order_address.telephone_number = 'aaaddddcccc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが10桁より小さいと購入できない' do
        @order_address.telephone_number = '080220022'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが11桁より大きいと購入できない' do
        @order_address.telephone_number = '080220022000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
