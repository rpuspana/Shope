class LineItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :order
    
    def self.from_cart_item(cart_item)
        li = self.new
        
        product_id = cart_item.product_id
        product = Product.find(product_id)
        
        li.product = product
        li.quantity = cart_item.quantity
        li.total_price = cart_item.total_price_for_copys_of_product(product_id)
        
        li
    end
end
