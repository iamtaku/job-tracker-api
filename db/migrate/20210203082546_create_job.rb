class CreateJob < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :company
      t.string :position
      t.string :application_link
      t.string :status, default: 'in-progress'
      t.references :user, null: false, type: :uuid, foreign_key: true, index: true
    end
  end
end
