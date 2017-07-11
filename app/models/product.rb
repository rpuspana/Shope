class Product < ActiveRecord::Base
    has_many :line_items
    validates_presence_of :title, :description, :image_url
    validates_numericality_of :price
    validates_uniqueness_of :title
    validate :price_must_be_grater_than_zero
    validates_format_of :image_url,
                        :with => %r{\.(gif|jpg|png)$}i,
                        :message => 'must be a URL for GIF, JPG or PNG image.'
    
  #  def self.search(search) 
   #   if search #dc am ceva in cutie
    #    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
     # else
      #  find(:all)
      #end
    #end
    def self.search(search) 
        find(:all, :conditions => "title  = '#{search}'")
    end
    
    def self.find_products_for_sale
        find(:all, :order => "title" )
    end
    
    protected
        def price_must_be_grater_than_zero
            errors.add(:price, 'should be at least $ 0.01') if price.nil? || price < 0.01
        end
        
                       
end
