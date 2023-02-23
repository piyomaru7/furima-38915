# テーブル設計

## users

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|first_name        |string|null: false              |
|last_name         |string|null: false              |
|first_name_kana   |string|null: false              |
|last_name_kana    |string|null: false              |
|birthday          |date  |null: false              |

### Association

- has_many :items
- has_many :orders

## items

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|name            |string    |null: false                   |
|explanation     |text      |null: false                   |
|category_id     |numeric   |null: false                   |
|status_id       |numeric   |null: false                   |
|postage_id      |numeric   |null: false                   |
|area_id         |numeric   |null: false                   |
|number_of_day_id|numeric   |null: false                   |
|price           |string    |null: false                   |
|user            |references|null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :order

## orders

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|zip_code        |string    |null: false                   |
|area_id         |numeric   |null: false                   |
|municipality    |string    |null: false                   |
|street_number   |string    |null: false                   |
|building_name   |string    |                              |
|telephone_number|string    |null: false                   |
|order           |references|null: false, foreign_key: true|

### Association

- belongs_to :order