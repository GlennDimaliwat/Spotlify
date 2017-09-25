class Artist < ApplicationRecord
    has_many :songs
    
    # name is required
    validates :name, presence: true
    
    # bio has a max length of 8000
    validates_presence_of :bio
    validates :bio, length: {maximum: 8000}

    # or:
    #validates :bio, presence: true, length: {maximum:8000}
end
