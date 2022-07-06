class Movie < ApplicationRecord
    validates :title, presence: true
    validates :year, presence: true, length: { is: 4 }, numericality: { only_integer: true }
    validates :poster, format: { with: /\A(http|https)/,  message: "the Poster should start with http" }, allow_blank: true

    belongs_to :category

    def already_in_db
        movie_attributes = self.attributes.slice('title', 'year', 'poster')

        if Movie.where(movie_attributes).present?
            self.errors.add(:error, "the Movie already exist in the database")
            return true
        else
            return false
        end
    end
end
