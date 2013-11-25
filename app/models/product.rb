class Product < ActiveRecord::Base
  has_many :sizes
  accepts_nested_attributes_for :sizes, allow_destroy: true
  has_attached_file :picture, :styles => { :medium => "300x300!", :thumb => "100x100!" }


  CATEGORY = ["COLECCION", "URBANO", "ACCESORIOS"]
  SUBCATEGORY = {coleccion:["CHANNEL","PIEL","TRAJES","ABRIGOS"], urbano:["PUNTO CLASICO","PUNTO DECO", "BÁSICOS", "IMPERMEABLES"], accesorios:["MANTAS", "COJINES", "COLLARES", "CORREAS"]}

  def sizes_exits_for size
    sizes.exists?(size: size)
  end
end
