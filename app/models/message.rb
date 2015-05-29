class Message < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: "User", foreign_key: "author"
end
