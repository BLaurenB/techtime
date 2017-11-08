class Freelancer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true
  belongs_to :category
  has_many :order_freelancers
  has_many :orders, through: :order_freelancers

  enum status: ["active", "retired"]
  attr_accessor :avatar_file_name


  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }


=begin
Additional ImageMagick resizing options can be found here
The has_attached_file method also accepts a styles hash that specifies the resize dimensions of the uploaded image. The > and # symbols will tell ImageMagick how the image will be resized (the > will proportionally reduce the size of the image).
=end

# Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar,
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg|jpg) images'

end
