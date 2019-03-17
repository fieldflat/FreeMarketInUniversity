class ChangeColumnsToEvaluations < ActiveRecord::Migration[5.1]
  def change
    remove_column :evaluations, :buyer_id
    add_column :evaluations, :from_id, :integer
    add_column :evaluations, :to_id, :integer
  end
end
