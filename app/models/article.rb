class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:20, maximum:200}
end
