class Movie < ApplicationRecord
    GENRES = %W[action comedy drama horror romance thriller fantasy animation documentary musical western].freeze

    has_many :comments, as: :commentable, dependent: :destroy

    validates :title, :year_of_creation, :duration, :director, presence: true
    validates :title, uniqueness: { scope: %i[year_of_creation] }
    validates :description, length: { minimum: 15 }
    validate :genres_validation

    private

    def genres_validation
        # genres.is_a?(Array) && genres.any? { |g| g.present? }
        unless genres.is_a?(Array) && genres.any?(&:present?)
            errors.add(:genres, 'at least one genre must be selected')
        end
    end
end