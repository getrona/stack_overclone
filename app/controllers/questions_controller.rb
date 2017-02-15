class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @question = Question.new(question_params)
    @user.questions.push(@question)
    if @user.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:question, :title, :user_id)
  end

end
