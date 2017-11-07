class AddAvatarToFreelancers < ActiveRecord::Migration[5.1]

  def self.up
    add_attachment :freelancers, :avatar
  end

  def self.down
    remove_attachment :freelancers, :avatar
  end

end
