class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    #validates_associated :user
    validates :title, :presence => { message: "Field cannot be blank" }
    validates :content, :presence => { message: "Field cannot be blank" }
end
