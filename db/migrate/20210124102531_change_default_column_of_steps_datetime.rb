class ChangeDefaultColumnOfStepsDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column_default :steps, :date, Date.today
  end
end
