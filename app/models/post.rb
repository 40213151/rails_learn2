class Post < ApplicationRecord
    validates :boyaki, {presence: true, length: {maximum:140}}
    validates :yosakoiyer_id, {presence: true}
    
    def yosakoiyer
        return Yosakoiyer.find_by(id: self.yosakoiyer_id)
    end
end
