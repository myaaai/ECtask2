class Public::HomesController < ApplicationController
    
def top
    @items = Item.all.last(4)
    

    
end

def about

end



end
