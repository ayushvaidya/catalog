class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :category, :presence => true

  has_one_attached :file

  validates :file, :presence => true
  validates :title, :presence => true

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if file.attached? && !file.content_type.in?(%w(audio/mp3 audio/x-mp3 audio/mpeg))
      errors.add(:file, 'Must be an MP3 file')
    end
  end
end
