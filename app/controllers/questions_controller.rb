# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController

  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    # if !user_signed_in?
    #   flash.now[:notice] = "You must be signed in to do that."
    #   render :index
    # else
      @question = Question.new
    # end
  end

  def create
    # call question_params when creating a new question
    @question = Question.new(question_params)

    if @question.save
      redirect_to '/questions'
    else
      flash.now[:notice] = "Uh oh! Your question could not be saved."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    #binding.pry
  end

  def question_params
    params.require(:question).permit(:title, :description, :author)
  end
end
