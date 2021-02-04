class AddColumnTimeStampsToJob < ActiveRecord::Migration[6.0]
  def change
    change_table :jobs do |t|
      t.timestamps
    end
  end
end
