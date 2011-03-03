class Product < ActiveRecord::Base
	validates_presences_of :title, descrition, :price, image_url
	validates_numericality_of :price, :greater_than => 0.01 
	validates_uniqueness_of :title
	validates_numericality_of :projection, :greater_than => 0
	validates_formate_of :image_url, :with => %r{\.(gif|jpg|png)$}i, message => "escribir solo letras"
	
	
		before_create :crear
		before_modifying :modificar
		before_delete :borrar

		protected
		def crear
		
			inventario = Inventory.new
			inventario.previous_balance = 0
			inventario.new_balance = ammount
			inventario.future_balance = ammount + projection
			inventario.save
		end
		def modificar
			anterior=Inventory.where("product_id = :id").last
			nueva = Inventory.new
			nueva.previous_balance = anterior.new_balance	
			nueva.new_balance = ammount
			nueva.future_balance = ammount + projection
			nueva.save
		end
		def borrar
			datos_a_eliminar = Inventory.find_by_product_id(id)
			datos_a_eliminar.each do |tupla|
			datos_a_eliminar.delete()
		end

	
	
	
end
