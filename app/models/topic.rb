class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: "User", foreign_key: "author"
  has_many :messages
end
