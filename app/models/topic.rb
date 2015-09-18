class Topic < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :title, :body, presence: true
  validates :title, :body, length: { minimum: 5 }
end
