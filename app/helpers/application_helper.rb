# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #
  # <button type="submit" class="button positive">
  #    <img src="/stylesheets/blueprint/plugins/buttons/icons/key.png" alt=""/> Sign Up
  # </button>
  #
  #def button_tag(name, icon, options={})
   # icon_path = '/stylesheets/buttons/'
    #icon_path += icon
    #img = tag("img", :src => icon_path,:alt =>"", :open => false)
    #img << ' ' + name
    #options.merge!("type" => 'submit') unless options[:type]
    #content_tag(:button, img, options)
  #end
  
  
T = Time.now

def time_24_hour
  T.strftime("%H:%M")
end

def full_date
  Date.today.to_s(:long)
end

def simple_date_and_time
  T.to_s(:short)
end

def chatty_time_and_date
  "It's " + time_24_hour + " on " + full_date
end

def currency_euro (item)
    number_to_currency(item, :unit => "&euro;",:separator => ",", :delimiter => "", :format => "%n %u")
  end

end
