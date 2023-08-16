class Article < ApplicationRecord
    validates :title , presence: true
    validates :author , presence: true
    validates :body , presence: true
end
