class App < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true  
  validates :price, numericality: true
  validates :video_link, presence: true
  validates :web_link, presence: true

  
  SKILLS = ["Communication", "Behavior Skills", "Safty Skills", "Daily Living Skills", "Fine Motor Skills"]
end
