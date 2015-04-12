class QuestionsController < ApplicationController
  require 'rest_client'

  def init 
    if current_user and current_user.is_admin != nil
      @response = RestClient.get 'https://www.kimonolabs.com/api/2tepoq7s?apikey=i4ShqnRlMKnYLTe9oGyIOyef9ybz0Qnp'
      @json = JSON.parse @response
      @questions = @json["results"]["Questions"]

      @questions.each do |q|
        if q["Content"]["text"].length == 0
          next
        end
        @question = Question.new
        @question.content = q["Content"]["text"]
        @question.source_url = q["Content"]["href"]
        @question.vote_count = 0
        @question.save!
      end
    else
      flash[:error] = "You have to be a logged in admin user to do this action"
      redirect_to root_path
    end
  end
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def scrape
  end
end
