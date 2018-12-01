class AddAttachmentPicToPhotos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :photos do |t|
      t.attachment :photos, :pic
    end
  end

  def self.down
    remove_attachment :photos, :pic
  end
end
