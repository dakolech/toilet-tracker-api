# == Schema Information
#
# Table name: wcstatuses
#
#  id         :integer          not null, primary key
#  is_busy    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wcstatus < ApplicationRecord
end
