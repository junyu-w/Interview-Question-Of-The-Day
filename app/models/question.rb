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
	#validates :content, presence: true
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
end
