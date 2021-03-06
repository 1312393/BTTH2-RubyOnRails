class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :follows
  has_many :followed, :through => :follows
  mount_uploader :avatar, AvatarUploader
  def self.search(search)
    where("email LIKE ?", "%#{search}%")
  end

end
