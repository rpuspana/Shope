class Order < ActiveRecord::Base

    PAYMENT_TYPES = [
        #Displayed         stored in db
        ["Check" ,         "check"],
        ["Credit card",    "credit card"],
        ["Purchase order", "purchase order"]
    ]
    
    validates_presence_of :name, :surname, :adress, :telephone, :email, :pay_type
    validates_length_of :email, :within => 2..128, :message => "The email has more than 128 characters.Please choose a ahorter one"
    validates_uniqueness_of :email, :message => "This email is already taken.Please supply a new one"
    validates_format_of :email, :with => /\A([\w\.\-\+\_]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "This is not a valid email adress.Please renter email"
    #validate_with EmailValidator  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
    validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map{|disp, value| value}
   
    has_many :line_items
    
    def add_line_items_from_cart(cart)
        cart.items.each do |item|
            li = LineItem.from_cart_item(item)
            line_items << li
        end
    end
end
