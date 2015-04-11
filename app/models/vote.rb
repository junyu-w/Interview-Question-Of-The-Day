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

  validates :user_id, presence: true, uniqueness: true
  validates :question_id, presence: true, uniqueness: true

  belongs_to :question
  belongs_to :user 

end
