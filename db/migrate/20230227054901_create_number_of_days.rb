class CreateNumberOfDays < ActiveRecord::Migration[6.0]
  def change
    create_table :number_of_days do |t|

      t.timestamps
    end
  end
end
