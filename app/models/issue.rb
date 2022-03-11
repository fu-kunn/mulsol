class Issue < ApplicationRecord
  belongs_to :customer

  # 検索方法分岐 ニーズ
  def self.looks(search, word)
    if search == "perfect_match"
      @issue = Issue.where("needs LIKE?","#{word}")
    elsif search == "forward_match"
      @issue = Issue.where("needs LIKE?","#{word}%")
    elsif search == "backward_match"
      @issue = Issue.where("needs LIKE?","%#{word}")
    elsif search == "partial_match"
      @issue = Issue.where("needs LIKE?","%#{word}%")
    else
      @issue = Issue.all
    end
  end

  # 検索方法分岐 課題
  def self.looks(search, word)
    if search == "perfect_match"
      @issue = Issue.where("challenge LIKE?","#{word}")
    elsif search == "forward_match"
      @issue = Issue.where("challenge LIKE?","#{word}%")
    elsif search == "backward_match"
      @issue = Issue.where("challenge LIKE?","%#{word}")
    elsif search == "partial_match"
      @issue = Issue.where("challenge LIKE?","%#{word}%")
    else
      @issue = Issue.all
    end
  end
end
