class Cart
 
    def initialize #the method that is invoked when we call Cart.new
        @items = []
    end
    
    def items # GET items
        @items
    end
    
    def has_products
        if @items.size > 0
            true
        else
            false
        end
    end
    
    def total_price_of_products
        sum = 0
        for item in @items
            product_id = item.product_id
            sum = sum + item.total_price_for_copys_of_product(product_id)
        end
        sum
    end
     
    def add_product(product_id)
        # search the cart if there is already a product with this id
        current_item = @items.find {|item| item.product_id == product_id}
        if current_item
            current_item.increment_quantity
        else # dc nu s-a gasit produsul
            # in items se baga tot id-uri de produse si cate bucati ale acelui produs
          @items << CartItemCount.new(product_id)
        end
    end
    
    def decrement_by_one_quantity_of_product(product_id)
        current_item = @items.find{|item| item.product_id == product_id}
        if current_item
            if current_item.quantity_of_item_is_zero == false
                current_item.decrement_quantity
                if current_item.quantity_of_item_is_zero == true
                   idx = @items.index(current_item)#find the index of current_item in the array items
                    @items.delete_at(idx)#delete current_item at index idx from array
                end
            end
         end
    end 
    def decrement_by_n_quantity_of_product(product_id)
        current_item = @items.find{|item| item.product_id == product_id}
        if current_item
            idx = @items.index(current_item)#find the index of current_item in the array items
            @items.delete_at(idx)#delete current_item at index idx from array
        end
    end
         
end
