class Product < ApplicationRecord
    belongs_to :user
    has_many(:reviews, dependent: :destroy)

    validates(:title, presence: true, uniqueness: {case_sensitive: false})
        validates(
            :description,
            presence: { message: "must exist" },
            length: { minimum: 5 }
        )
        validates(
            :price,
            numericality: { greater_than_or_equal_to: 0, allow_blank: true }
        )
end






