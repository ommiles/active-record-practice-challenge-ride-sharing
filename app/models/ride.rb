class Ride < ActiveRecord::Base
    belongs_to :driver
    belongs_to :passenger

    def print_details
        puts "#{self.driver.name} drove #{self.passenger.name} for $#{self.price} from #{self.pick_up} to #{self.drop_off}."
    end
end