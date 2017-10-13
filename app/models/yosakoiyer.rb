class Yosakoiyer < ApplicationRecord
    validates :yosaname,{presence: true, length: {maximum: 20}}
    validates :mail,{presence: true, uniqueness: true}
    validates :password,{presence:true}
    
    def posts
        return Post.where(yosakoiyer_id: self.id)
    end
end
