class Movie < ApplicationRecord
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true

  mount_uploaders :images, PictureUploader
  serialize :images
  has_attached_file :avatar, styles: { medium: "100x100", thumb: "50x50" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
