class Category < ApplicationRecord
  has_many :posts, :dependent => :delete_all
  belongs_to :user

  validates :name, :presence => true


  before_create :set_slug


  def to_param
    slug
  end

  private

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Category.where(slug: slug).exists?
    end
  end

end
