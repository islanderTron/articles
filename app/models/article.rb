class Article < ApplicationRecord
    # Validation form
    validates :title, presence: true, 
        length: {minimum: 5}
        # uniqueness: { case_sensitive: false }, 
        # length: {maximum: 50}, 
        # format: { with: ConstantData::VALID_EMAIL_REGEX }, 
        # if: :method_name?
    
    
end
