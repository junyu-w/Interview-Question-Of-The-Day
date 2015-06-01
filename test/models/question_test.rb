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

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
end
