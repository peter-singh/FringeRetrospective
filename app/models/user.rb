class User < ApplicationRecord
  # after_initialize :set_default_votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :favourites
  has_many :searches
  has_many :lists
  validates_uniqueness_of :username

  def reduce_votes_left
    current_votes = votes_left
    return false if current_votes <= 0
    update_attributes(votes_left: (current_votes - 1))
  end

  def reset_votes
    @amount = self.vote_reset_amount + self.votes_left
    self.votes_left = @amount
    puts self.save!
  end

  def set_default_votes
    update(votes_left: 100)
  end

  def self.replenish_votes
    User.all.each do |user|
      user.reset_votes
    end
  end
end
