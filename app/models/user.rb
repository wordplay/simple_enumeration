# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates_inclusion_of :status, :in => [:active, :inactive, :suspended]

  def status
    value = read_attribute(:status)
    value.blank? ? nil : value.to_sym
  end
  
  def status= (value)
    write_attribute(:status, value.to_s)
  end
end
