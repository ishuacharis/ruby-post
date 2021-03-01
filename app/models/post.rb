class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    #validates_associated :user
    validates :title, :presence => { message: "Field cannot be blank" }
    validates :content, :presence => { message: "Field cannot be blank" }

    # get username from User
    # no params
    # return username | string
    def username
        user.username
    end

    def self.get_all_posts
        order(id: :desc)
    end
end
