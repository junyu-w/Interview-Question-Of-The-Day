class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    require 'rest_client'
    @response = RestClient.get 'https://www.kimonolabs.com/api/2tepoq7s?apikey=i4ShqnRlMKnYLTe9oGyIOyef9ybz0Qnp'

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
