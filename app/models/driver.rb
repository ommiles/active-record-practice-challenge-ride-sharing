class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def accept_ride_request(passenger, price, pick_up, drop_off)
        Ride.create(driver: self, passenger: passenger, price: price, pick_up: pick_up, drop_off: drop_off)
    end

    def total_income
        self.rides.sum("price")
    end

    def cancel_ride(passenger)
        temp = self.rides.find_by(passenger: passenger)
        temp.destroy
    end

    def self.most_active
        self.all.max { |a, b| a.rides.count <=> b.rides.count }
        # self.all.maximum("rides COUNT")
    end

    def self.best_performing_driver
        self.all.order("rating DESC").first
    end
end