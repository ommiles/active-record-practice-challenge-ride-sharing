class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def car_list
        self.drivers.collect {|driver| driver.car}.join("; ")
    end

    def self.average_rating
        self.all.average(:rating)
    end

    def self.worst_rated
        self.all.order("rating DESC").last
    end

    def self.worst_rating_in_existence
        self.worst_rated.rating
    end
end