class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true

  include AASM
  # draft / published / reserve met / won / canceled / reserve not met
    aasm do
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :succeed do
      transitions from: :published, to: :reserve_met
    end

    event :fail_reserve do
      transitions from: :published, to: :reserve_not_met
    end

    event :winner do
      transitions from: :reserve_met, to: :won
    end

    event :cancel do
      transitions from: :published, to: :draft
    end
  end

end
