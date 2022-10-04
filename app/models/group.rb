class Group < ApplicationRecord
    has_many :articles
    belongs_to :user
    has_many :user_groups
    has_many :users, through: :user_groups
    has_one_attached :image
    
end
