class AddTimeStampsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.timestamps
    end
  end
end
