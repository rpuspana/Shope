class CartItemCount
    attr_reader :product_id, :quantity
    
    def initialize(product_id)
        @product_id = product_id
        @quantity = 1
    end
    
    def increment_quantity
        @quantity = @quantity + 1
    end
    
    def quantity_of_item_is_zero
        if @quantity == 0 
            true
        else
            false
        end
    end
    
    def decrement_quantity
        if not @quantity == 0 
            @quantity = @quantity - 1
        end
    end
    
    def total_price_for_copys_of_product(product_id)
        @product = Product.find(product_id)
        @product.price * @quantity
    end
end
