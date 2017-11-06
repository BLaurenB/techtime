class AddAttachmentAvatarToFreelancers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :freelancers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :freelancers, :avatar
  end
end
