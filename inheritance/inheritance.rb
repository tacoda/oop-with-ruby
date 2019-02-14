# Acquiring behavior through Inheritance

# Inheritance solves the problem of highly related types that share common behavior but differ along some dimension.

# UML is the tool to use here.

# Refactoring strategy:
# Push everything down then pull some things up

class Bicycle
# This class is now empty.
# All code has been moved to RoadBike.
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    # This technique of defining a basic structure in the superclass and sending messages to acquire subclass-specific contributions is known as the template method pattern.
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannot respond to:"
  end

  def spares
    { tire_size: tire_size.
      chain: chain }.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
# Now a subclass of Bicycle.
# Contains all code from the old Bicycle class.
  attr_reader :tape_color
  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def default_tire_size
    '23'
  end

  def local_spares
    {tape_color: tape_color}
  end
end

class MountainBike < Bicycle
# Still a subclass of Bicycle (which is now empty). # Code has not changed.
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def default_tire_size
    '2.1'
  end

  def local_spares
    { front_shock: front_shock,
      rear_shock: rear_shock }
  end
end

road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red')

puts road_bike.tire_size
puts road_bike.chain

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.tire_size
puts mountain_bike.chain

# Summary

# Inheritance solves the problem of related types that share a great deal of
# common behavior but differ across some dimension. It allows you to isolate
# shared code and implement common algorithms in an abstract class, while also
# providing a structure that permits subclasses to contribute specializations.
#
# The best way to create an abstract superclass is by pushing code up from
# concrete subclasses. Identifying the correct abstraction is easiest if you
# have access to at least three existing concrete classes. This chapter’s simple
# example relied on just two but in the real world you are often better served
# to wait for the additional information that three cases supply.
#
# Abstract superclasses use the template method pattern to invite inheritors to
# supply specializations, and use hook methods to allow these inheritors to
# contribute these specializations without being forced to send super. Hook
# methods allow subclasses to contribute specializations without knowing the
# abstract algorithm. They remove the need for subclasses to send super and
# therefore reduce the coupling between layers of the hierarchy and increase
# its tolerance for change.
#
# Well-designed inheritance hierarchies are easy to extend with new subclasses,
# even for programmers who know very little about the application. This ease of
# extension is inheritance’s greatest strength. When your problem is one of
# needing numerous spe- cializations of a stable, common abstraction,
# inheritance can be an extremely low-cost solution.
