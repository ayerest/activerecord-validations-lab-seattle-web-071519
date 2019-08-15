class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        clickbait_words = [
            /Won't Believe/i,
            /Secret/i,
            /Top [0-9]*/i,
            /Guess/i
        ]
        if !clickbait_words.any? {|clickbait| clickbait.match(title)}
            errors.add(:title, "Title needs to include clickbait")
        end            
    end
end
