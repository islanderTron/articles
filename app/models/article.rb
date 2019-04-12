class Article < ApplicationRecord
    has_many :comments
    # Validation form
    validates :title, presence: true, 
        length: {minimum: 5}
end
