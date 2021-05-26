class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides

    def name
        "#{self.first_name} #{self.last_name}"
    end
end