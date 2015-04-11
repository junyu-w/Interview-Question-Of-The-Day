class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
  end

  def create
    @question = Question.find(params[:id])
    @new_vote = Vote.new(user_id: current_user.id, question_id:@question.id) 
    if @new_vote.save
      @quesiton.update_attribtues(:votes_count => @question.votes_count+1)
      if @quesiton.save
        redirect_to question_path(@quesiton)
      else
        flash[:error] = @question.errors.full_messages.to_sentence
        redirect_to question_path(@question)
      end
    else
      flash[:error] = @new_vote.errors.full_messages.to_sentence
      redirect_to question_path(@question)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    @vote = Vote.where(question_id: @question.id, user_id:current_user.id)
    if @vote.destroy
      @question.update_attribtues(:votes_count => @question.votes_count-1)
      if @question.save
        redirect_to question_path(@question)
      else
        flash[:error] = @question.errors.full_messages.to_sentence
        redirect_to question_path(@question)
      end
    else
      flash[:error] = @vote.errors.full_messages.to_sentence
      redirect_to question_path(@question)
    end
  end

  def upvote
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :question_id)
  end
end
