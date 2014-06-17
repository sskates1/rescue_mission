class RemoveUserIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :user_id, :integer
    remove_column :answers, :user_id, :integer

  end
end
