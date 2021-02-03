class AddColumnTimeStampsToStep < ActiveRecord::Migration[6.0]
  def change
    change_table :steps do |t|
      t.timestamps
     end
  end
end
