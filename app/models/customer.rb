class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :issues, dependent: :destroy
  belongs_to :sector, optional: true
  # has_many :sectors, dependent: :destroy
  has_many :customer_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :image
  has_many :contact, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたときの処理
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外すときの処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("company_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("company_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("company_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("company_name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end



  # def get_image
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image
  # end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
