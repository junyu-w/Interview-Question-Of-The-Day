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
    @question = Question.find(params[:question_id])
    @new_vote = Vote.new
    @new_vote.update_attributes(:user_id => current_user.id, :question_id => @question.id) 
    if @new_vote.save
      @question.update_attributes(:vote_count => @question.vote_count+1)
      if @question.save
        redirect_to question_path(@question)
      else
        flash[:error] = @question.errors.full_messages.to_sentence
        redirect_to question_path(@question)
      end
    else
      flash[:error] = "You have already voted"
      redirect_to question_path(@question)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @question = Question.find(params[:question_id])
    @vote = Vote.where(question_id: @question.id, user_id:current_user.id)
    if @vote.length != 0 and @vote.destroy_all
      @question.update_attributes(:vote_count => @question.vote_count-1)
      if @question.save
        redirect_to question_path(@question)
      else
        flash[:error] = @question.errors.full_messages.to_sentence
        redirect_to question_path(@question)
      end
    else
      flash[:error] = "You have downvoted"
      redirect_to question_path(@question)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :question_id)
  end
end
