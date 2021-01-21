class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :application_link
      t.string :status, default: 'in-progress'

      t.timestamps
    end
  end
end
