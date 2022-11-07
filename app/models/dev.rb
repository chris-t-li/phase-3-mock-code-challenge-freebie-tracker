class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.includes(item_name: item_name)
    end

    def give_away(dev, freebie)
        if self.freebies.includes(freebie)
            freebie.dev = dev
            freebie.save
        end
    end
end
