# Acquiring behavior through Inheritance

# Inheritance solves the problem of highly related types that share common behavior but differ along some dimension.

# UML is the tool to use here.

# Refactoring strategy:
# Push everything down then pull some things up

# TODO: Page 24

class Bicycle
# This class is now empty.
# All code has been moved to RoadBike.
  attr_reader :size

  def initialize(args={})
    @size = args[:size]
  end
end

class RoadBike < Bicycle
# Now a subclass of Bicycle.
# Contains all code from the old Bicycle class.
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end
end

class MountainBike < Bicycle
# Still a subclass of Bicycle (which is now empty). # Code has not changed.
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
end

road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red')

puts road_bike.size

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.size
