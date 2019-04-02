class Article < ApplicationRecord
    # Validation form
    validates :title, presence: true, 
        length: {minimum: 5}
end
