class Photo < ActiveRecord::Base
  belongs_to :product
  attr_accessor :delete
  has_attached_file :picture,
                    :styles => {
                      :large => "300x300>",
                      :medium => "250x250>",
                      :thumb => "100x100>"
                    },
                    :default_url => "no_photo.png",
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
                      :s3_host_name => 's3-eu-west-1.amazonaws.com'
                    }



end
