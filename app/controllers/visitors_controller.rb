class VisitorsController < ApplicationController
  @@random_nums = Array.new(7)
     
  def self.set_random
      @@random_nums = Array.new(7)
#      $random_agent = Random.new
      $i= 0
      if Question.count < 0
        Question.feed_question_info
      end
      while $i < 7 do
        @@random_nums[$i] =  1+Random.rand(Question.count)
        $i+=1
      end
      return @@random_nums
  end

  def self.getRandom
    if @@random_nums[0] == nil
      return VisitorsController.set_random
    else
      return @@random_nums
    end
  end

  def index
      @today_num = Date.today.cwday
      @today_name = ""
      @today_question = nil

      @question_array = Question.getWeeklyQuestionArray
      case @today_num
      when 1
      	@today_name = "Monday"
      	@today_question = @question_array[0] 
      when 2
      	@today_name = "Tuesday"
      	@today_question = @question_array[1] 
      when 3
      	@today_name = "Wednesday"
      	@today_question = @question_array[2] 
      when 4
      	@today_name = "Thursday"
      	@today_question = @question_array[3] 
      when 5
      	@today_name = "Friday"
      	@today_question = @question_array[4] 
      when 6
      	@today_name = "Saturday"
      	@today_question = @question_array[5] 
      when 7
      	@today_name = "Sunday"
      	@today_question = @question_array[6] 
      end
  end

end
