class VisitorsController < ApplicationController
  @@random_nums = Array.new(7)
     
  def self.set_random
      @@random_nums = Array.new(7)
      $random_agent = Random.new
      $i= 0
      while $i < 7 do
        @@random_nums[$i] =  $random_agent.rand(1..Question.count)
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

      if Question.all.length == 0
        Question.new
      end
      @question_M = Question.find(VisitorsController.getRandom[0])
      @question_T = Question.find(VisitorsController.getRandom[1])
      @question_W = Question.find(VisitorsController.getRandom[2])
      @question_TT = Question.find(VisitorsController.getRandom[3])
      @question_F = Question.find(VisitorsController.getRandom[4])
      @question_S = Question.find(VisitorsController.getRandom[5])
      @question_SS = Question.find(VisitorsController.getRandom[6])

      case @today_num
      when 1
      	@today_name = "Monday"
      	@today_question = @question_M
      when 2
      	@today_name = "Tuesday"
      	@today_question = @question_T
      when 3
      	@today_name = "Wednesday"
      	@today_question = @question_W
      when 4
      	@today_name = "Thursday"
      	@today_question = @question_TT
      when 5
      	@today_name = "Friday"
      	@today_question = @question_F
      when 6
      	@today_name = "Saturday"
      	@today_question = @question_S							
      when 7
      	@today_name = "Sunday"
      	@today_question = @question_SS
      end
  end

end
