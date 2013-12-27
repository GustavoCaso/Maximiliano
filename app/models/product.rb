class Product < ActiveRecord::Base
  has_many :sizes, -> { order "position" }

  accepts_nested_attributes_for :sizes, allow_destroy: true

  has_attached_file :picture,
                    :styles => {
                      :large => "300x300>",
                      :medium => "250x250>",
                      :thumb => "100x100>"
                    },
                    :default_url => "no_photo.png",
                    :storage => :s3,
                    :bucket => 'maximiliano',
                    :s3_credentials => {
                      :access_key_id => 'AKIAJ4NHUVKQUW446QPA',
                      :secret_access_key => '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'
                    }

  validates_presence_of :name, :description, :category, :sub_category

  CATEGORIES = {coleccion:["CHANNEL","PIEL","TRAJES","ABRIGOS"], urbano:["PUNTO CLASICO","PUNTO DECO", "BÁSICOS", "IMPERMEABLES"], accesorios:["MANTAS", "COJINES", "COLLARES", "CORREAS"]}

  def sizes_exits_for size
    sizes.exists?(size: size)
  end


  def stock?
     not sizes.sum {|size| size.stock.to_i}.zero?
  end

  def self.search(search)
    if search
      all.where(category: search)
    else
      all
    end
  end


end
