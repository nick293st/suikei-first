class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :waterscapes, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked, through: :likes, source: :user
    has_many :liker, through: :likes, source: :waterscape
    
    # ---like unlike---
    def like(waterscape)
      self.likes.find_or_create_by(waterscape_id: waterscape.id)
    end
    
    def unlike(waterscape)
      like = self.likes.find_by(waterscape_id: waterscape.id)
      like.destroy if like
    end
    
    def liking?(waterscape)
      self.liker.include?(waterscape)
    end
end
