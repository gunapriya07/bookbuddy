class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
    after_initialize :set_default_favorite, if: :new_record?

  private

  def set_default_favorite
    self.favorite = false if favorite.nil?
  end
end
