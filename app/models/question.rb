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

	
end
