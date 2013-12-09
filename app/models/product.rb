class Product < ActiveRecord::Base
  has_many :sizes, -> { order "position" }


  accepts_nested_attributes_for :sizes, allow_destroy: true

  has_attached_file :picture, :styles => {:large => "300x300>", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "no_photo.png"




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
