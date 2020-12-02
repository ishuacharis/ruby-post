class Post < ApplicationRecord
    belongs_to :user
    #validates_associated :user
    validates :title, :presence => true
    validates :content, :presence => true
end
