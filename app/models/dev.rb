class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        return true if self.freebies.find_by(item_name: item_name)
         
        false
    end
    
    def give_away(dev, freebie)
        freebie.update(dev: dev) if freebie.dev == self
    end
end
