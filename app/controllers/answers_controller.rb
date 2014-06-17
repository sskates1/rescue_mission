class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    # use answer_params method
    @answer = Answer.new(answer_params)
    # create an association between @answer and @question with the right
    # question_id on the answer
    @answer.question = @question

    if @answer.save
      # use redirect_to instead of redirect
      redirect_to "/questions/#{@question.id}"
    else
      flash.now[:notice] = "Uh oh!  Could not post your answer."
      # use render instead of erb
      render template: 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit( :author, :description)
  end
end
