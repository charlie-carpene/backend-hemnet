class Movie < ApplicationRecord
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
