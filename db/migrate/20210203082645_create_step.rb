class CreateStep < ActiveRecord::Migration[6.0]
  def change
    create_table :steps, id: :uuid do |t|
      t.datetime :date, default: Date.today
      t.string :status
      t.references :job, null: false, type: :uuid, foreign_key: true, index: true
    end
  end
end
