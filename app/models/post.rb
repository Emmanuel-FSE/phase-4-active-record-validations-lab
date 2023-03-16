class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    private
    def clickbait
        unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.match?(/Top \d+/) || title.include?("Guess"))
            errors.add(:title, "must be clickbait-y")
        end
    end
    
end
