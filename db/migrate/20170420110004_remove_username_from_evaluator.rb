class RemoveUsernameFromEvaluator < ActiveRecord::Migration[5.0]
  def change
    remove_column  :evaluators, :username
  end
end
