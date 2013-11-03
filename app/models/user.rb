class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications

  def twitter_client
    authentications.where(provider: "twitter").first.twitter_client
  end

  has_one :story

  before_create :ensure_story_exists

  def ensure_story_exists
    self.story = Story.new(body: "I'm supporting All-In To Fight Cancer.") 
  end
end
