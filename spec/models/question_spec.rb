require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "test on create instance of different models" do
    #test creation
    it "should not create question without content or url" do
      question_without_content = Question.new(source_url: "www.google.com")
      question_without_url = Question.new(content: "what")

      expect(question_without_content.save).to eq false
      expect(question_without_url.save).to eq false
    end
  end

  context "test on getting questions from internet" do
    it "should return 7 questions in an array" do
      question_array = Question.getWeeklyQuestionArray
      expect(question_array.length).to eq 7
    end
  end
  
end
