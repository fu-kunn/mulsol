class Issue < ApplicationRecord
  belongs_to :customer

  validates :needs, length: { maximum: 235 }
  validates :challenge, length: { maximum: 400 }
  validates :needs, presence: true
  validates :challenge, presence: true


  # 検索方法分岐 ニーズ・課題
  def self.looks(search, word)
    if search == "perfect_match"
      @issue = Issue.where(['needs LIKE(?) OR challenge LIKE(?)',"#{word}","#{word}"])
    elsif search == "forward_match"
      @issue = Issue.where(['needs LIKE(?) OR challenge LIKE(?)',"#{word}%","#{word}%"])
    elsif search == "backward_match"
      @issue = Issue.where(['needs LIKE(?) OR challenge LIKE(?)',"%#{word}","%#{word}"])
    elsif search == "partial_match"
      @issue = Issue.where(['needs LIKE(?) OR challenge LIKE(?)',"%#{word}%","%#{word}%"])
    else
      @issue = Issue.all
    end
  end
end
