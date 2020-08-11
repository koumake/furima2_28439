class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exhibitions
  has_many :purchases 
  has_one :address
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "exhibition"
  has_many :saling_items, -> { where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "exhibition"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "exhibition"
         
  validates :firstname, :lastname, :firstname_alias, :lastname_alias, :nickname, :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '6文字以上の半角英数字'
end
