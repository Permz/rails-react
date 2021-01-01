class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify

  def slugify
    self.slug = name.parameterize # parameterizeはURLで使用できるよう正規化
  end

  def avg_score
    reviews.average(:score).round(2).to_f # roundは四捨五入
  end
end
