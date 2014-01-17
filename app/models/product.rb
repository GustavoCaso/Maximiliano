class Product < ActiveRecord::Base
  has_many :sizes, -> { order "position" }
  has_many :photos

  accepts_nested_attributes_for :sizes, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

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
