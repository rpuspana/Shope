class StoreController < ApplicationController
 
 def index
   @search_results = find_products
   #puts session.inspect
   case @search_results
   when :no_search
   when :empty_query
     flash.now[:notice] = "You haven't searched for anything."
   when :no_results
     flash.now[:notice] = "No results found."
   when :results_found
      flash.now[:notice] = "Results found!"
   end
 end

def show_cart
  @cart = find_cart
 #if @cart.has_products == false
  #  flash[:notice] = "You haven't baught any books yet"
  #end

end

def add_to_cart #if the buy button was clicked
   product_id = params[:id]
   if product_id.to_i != 0
      @cart = find_cart
      @cart.add_product(product_id)
      flash[:notice] = "A new product has beed added to your shopping cart"
   else
      flash[:notice] = "You tried to enter an invalid product to the cart"
   end
   redirect_to :action => "index"
end

def remove_one_copy_of_a_book_from_cart
  product_id = params[:id]
  if product_id.to_i != 0
     @cart = find_cart
     @cart.decrement_by_one_quantity_of_product(product_id)
    display_message_redirect_action("The product was successfully removed from the cart","show_cart")
   else
    display_message_redirect_action("You tried to remove an invalid product to the cart","show_cart")
    #fac o metoda care indica eroarea ca find_products
  end
end

def remove_copys_of_a_book_from_cart
   product_id = params[:id]
   if product_id.to_i != 0
      @cart = find_cart
      @cart.decrement_by_n_quantity_of_product(product_id)
      display_message_redirect_action("All of the copys have been removed form your cart","show_cart")
   end
end

def empty_cart
   session[:cart] = nil
   display_message_redirect_action("All your products have been removed from the cart","show_cart")
end

def checkout
   @cart = find_cart
   if @cart.items.empty?
      display_message_redirect_action("Your cart is empty, therefore you can't proceed to checkout'","show_cart")
   else
      @order = Order.new
   end
end

def save_order
   @cart = find_cart
   @order = Order.new(params[:order])
   @order.add_line_items_from_cart(@cart)
   if @order.save
    session[:cart] = nil
     flash[:notice] = "Thank you for placing your order.Please come again soon"
     redirect_to :action => 'index'
   else
      redirect_to :action => 'checkout'
   end
end

private
  def display_message_redirect_action(message, action)
     flash[:notice] = message
     redirect_to :action => action
     return
  end
  
  def find_cart
    unless session[:cart] #if there isn't a value corresponding to the key :cart
      session[:cart] = Cart.new #that valule is created, namely a Cart instance
    end
    session[:cart] # return the the value, a Cart instance,  from session[:cart]
  end
  
  def find_products
     
    if params[:search].nil? # The user is on the index page and this isn't a search
      @products = Product.find_products_for_sale
      return :no_search
    elsif params[:search] == "" # The user has searched using an empty string
      @products = Product.find_products_for_sale
      return :empty_query
    else
      @products = Product.search(params[:search].upcase) # A regular search
      if @products.empty?
        @products = Product.find_products_for_sale
        return :no_results
      else
        return :results_found
      end
 
    end
  end

end
