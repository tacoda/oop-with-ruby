# Reducing Costs with Duck Typing

# Treat objects as if they are defined by their behavior rather than by their class

# Recognizing Hidden Ducks

# - Case statements that switch on class
# - kind_of? and is_a?
# - responds_to?

# Summary

# Messages are at the center of object-oriented applications and they pass among
# objects along public interfaces. Duck typing detaches these public interfaces
# from specific classes, creating virtual types that are defined by what they do
# instead of by who they are.
# Duck typing reveals underlying abstractions that might otherwise be invisible.
# Depending on these abstractions reduces risk and increases flexibility, making
# your application cheaper to maintain and easier to change.

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_trip(self) }
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(trip)
    'prepare bicycle'
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
    'buy food'
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
    'gas up'
  end

  def fill_water_tank(vehicle)
    'fill water tank'
  end
end
