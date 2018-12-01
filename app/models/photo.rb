class Photo < ApplicationRecord
  belongs_to :movie

  has_attached_file :pic,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    styles: { medium: "100x100", thumb: "50x50" }

  do_not_validate_attachment_file_type :pic
end
