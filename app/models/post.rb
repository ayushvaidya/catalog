class Post < ApplicationRecord
  before_create :set_slug
  belongs_to :category
  acts_as_list scope: :category
  belongs_to :user
  validates :category, :presence => true

  has_one_attached :file

  validates :file, :presence => true
  validates :title, :presence => true

  validate :correct_document_mime_type

  has_many :comments


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

  def correct_document_mime_type
    if file.attached? && !file.content_type.in?(%w(audio/mp3 audio/x-mp3 audio/mpeg))
      errors.add(:file, 'Must be an MP3 file')
    end
  end



end
