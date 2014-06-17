class AddAuthorToQuestionsAndAnswers < ActiveRecord::Migration
  def change
    add_column :questions, :author, :string
    add_column :answers, :author, :string
  end
end
