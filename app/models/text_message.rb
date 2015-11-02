class TextMessage < ActiveRecord::Base
  belongs_to :user

  validates :to, :presence => true
  validates :from, :presence => true
  validates :body, :presence => true
end
