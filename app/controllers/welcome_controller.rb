class WelcomeController < ApplicationController
    # public methods of a controller are called "actions".
    # These methods are responsible for generatinga response to a request
  
  
    def root
    
    end
  
    def contact_us
        
    end
    def process_contact
        render :thank_you
    end
  
    
  end
  