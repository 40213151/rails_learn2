class Ine < ApplicationRecord
    validates :post_id,{presence: true}
    validates :yosakoiyer_id,{presence: true}
end
