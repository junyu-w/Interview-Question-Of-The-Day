# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :User 
  belongs_to :Question
end
