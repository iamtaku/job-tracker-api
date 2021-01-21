class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.datetime :date
      t.string :status, default: 'in-progress'
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
