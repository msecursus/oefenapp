class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  
  has_attached_file :image, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }
 validates_attachment :image,
      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/svg"] }
  validates_attachment :image_size
  
  default_scope -> {order(updated_at: :desc)}
  
  def likes_total
    self.likes.where(like: true).size
  end
  def dislikes_total
    self.likes.where(like: false).size
  end
  
  private
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "image should be less than 5MB")
  end
    
  end
end
