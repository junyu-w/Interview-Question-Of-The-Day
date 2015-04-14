# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  source_url :string(255)
#  selected   :boolean
#  created_at :datetime
#  updated_at :datetime
#  vote_count :integer
#

class Question < ActiveRecord::Base

    validates :source_url, presence: true, uniqueness: true
    belongs_to :User
    has_one :vote

    def self.feed_question_info
      require 'rest_client'
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
    end

    def self.getWeeklyQuestionArray
      today_num = Date.today.cwday
      today_name = ""
      today_question = nil

      if Question.all.length == 0
        Question.feed_question_info
      end
      question_M = Question.find(VisitorsController.getRandom[0])
      question_T = Question.find(VisitorsController.getRandom[1])
      question_W = Question.find(VisitorsController.getRandom[2])
      question_TT = Question.find(VisitorsController.getRandom[3])
      question_F = Question.find(VisitorsController.getRandom[4])
      question_S = Question.find(VisitorsController.getRandom[5])
      question_SS = Question.find(VisitorsController.getRandom[6])

      return [question_M, question_T, question_W, question_TT, question_F, question_S, question_SS] 
    end


end
