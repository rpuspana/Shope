class AddTestData < ActiveRecord::Migration
  def self.up
    Product.create(:title => 'The Drinking Den',
      :description => 
      %{
        Set in the taverns of Paris, this is perhaps the first classical tragedy of 
        working-class people living in the slums of a city. 
        The Drinking Den (1877) is part of the Rougon-Macquart series, a naturalistic history 
        of two branches of a family tracedthrough several generations. The work of Zola 
        was influenced by contemporary theories of heredity and experimental science, 
        and the behaviour of the two families is shown to be conditioned by environment 
        and inherited characteristics, chiefly drunkenness and mental instability.
        },
    :image_url =>   '/images/the_drinking_den.gif',    
    :price => 29.95)
    
    Product.create(:title => 'S.',
      :description => 
      %{
         In a moment of sudden inspiration Sarah Worth - S. - has walked out 
        on her husband to join the Ashram Arhat. Famous for his 
        transcendent wisdom and divine immobility, the Arhat 
        has transferred his ahram from India to Arizona, 
                      where he and his enthusiastic entourage are attempting to make the 
        desert fruitful.
        },
        :image_url => '/images/S.jpg',
        :price => 13)
                      
    Product.create(:title => 'Sketches from an album of the Hunter',
      :description => 
      %{
        The first major prose work of Turgenev is a series of 
        twenty-five Sketches: the observations and anecdotes of the author during 
        his travels through Russia satisfying his passion for hunting. 
        His album is filled with moving insights into the lives of those he 
        encounters - peasants and landowners, doctors and bailiffs, neglected wives 
        and bereft mothers - each providing a glimpse of love, tragedy, courage 
        and loss. 
        },
       :image_url => '/images/sketches_from_a_hunter.jpg',
       :price => 10)
                   
    Product.create(:title => 'Epitaph for a Spy',
      :description => 
       %{
          Josef Vadassy, a Hungarian refugee and language teacher living in France,
          is enjoying his first break for years in a small hotel on the Riviera.
          But when he takes his holiday photographs to be developed at a local 
          chemists, he suddenly finds himself mistaken for a Gestapo agent and a 
          charge of espionage is levelled at him. To prove himself innocent to 
          the French police, he must discover which one of his fellow guests at 
          his pension is the real spy. 
          },
        :image_url => '/images/epitaph_for_a_spy.jpg',
        :price => 14)                
                  
     
    
  end

  def self.down
   Product.delete_all
  end
end
