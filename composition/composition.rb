# Combining Objects with Composition

# Composition is a has-a relationship

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

# class Parts
#   attr_reader :parts
#
#   def initialize(parts)
#     @parts = parts
#   end
#
#   def spares
#     parts.select {|part| part.needs_spare }
#   end
#
#   def default_tire_size
#     raise NotImplementedError
#   end
#
#   def post_initialize(args)
#     nil
#   end
#
#   def local_spares
#     {}
#   end
#
#   def default_chain
#     '10-speed'
#   end
#
#   def size
#     parts.size
#   end
# end

require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select {|part| part.needs_spare }
  end
end

# class Part
#   attr_reader :name, :description, :needs_spare
#
#   def initialize(args)
#     @name = args[:name]
#     @description = args[:description]
#     @needs_spare = args.fetch(:needs_spare, true)
#   end
# end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    '2.1'
  end
end

# chain = Part.new(name: 'chain', description: '10-speed')
# road_tire = Part.new(name: 'tire_size', description: '23')
# tape = Part.new(name: 'tape_color', description: 'red')
# mountain_tire = Part.new(name: 'tire_size', description: '2.1')
# rear_shock = Part.new(name: 'rear_shock', description: 'Fox')
# front_shock = Part.new(name: 'front_shock',
#                       description: 'Manitou',
#                       needs_spare: false)
#
# road_bike_parts = Parts.new([chain, road_tire, tape])
#
# road_bike = Bicycle.new(
#   size: 'L',
#   parts: Parts.new([chain,
#                     road_tire,
#                     tape]))
#
# p road_bike.size
# p road_bike.spares
#
# mountain_bike = Bicycle.new(
#   size: 'L',
#   parts: Parts.new([chain,
#                     mountain_tire,
#                     front_shock,
#                     rear_shock]))
#
# p mountain_bike.spares.size
# p mountain_bike.parts.size

require 'ostruct'
module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.collect {|part_config|
        create_part(part_config)})
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name: part_config[0],
      description: part_config[1],
      needs_spare: part_config.fetch(2, true))
  end
end

road_config =
  [[ 'chain', '10-speed'],
   ['tire_size', '23'],
   ['tape_color', 'red']]

mountain_config =
  [['chain', '10-speed'],
   ['tire_size', '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock', 'Fox']]

road_parts = PartsFactory.build(road_config)
p road_parts

mountain_parts = PartsFactory.build(mountain_config)
p mountain_parts

# Delegation is when one object receives a message and merely forwards it to another. Delegation creates dependen- cies; the receiving object must recognize the message and know where to send it.

# Composition often involves delegation but the term means something more. A composed object is made up of parts with which it expects to interact via well-defined interfaces.
# Composition describes a has-a relationship. Meals have appetizers, uni- versities have departments, bicycles have parts. Meals, universities, and bicy- cles are composed objects. Appetizers, departments, and parts are roles. The composed object depends on the interface of the role.

# Aggregation: A special kind of composition
# Aggregation is exactly like composition except that the contained object has an independent life.

## Deciding Between Inheritance and Composition

# Inheritance: For the cost of arranging objects in a hierarchy, you get message delegation for free.
# Composition: Composition allows objects to have structural independence, but at the cost of explicit message delegation.

# The general rule is that, faced with a problem that composition can solve, you should be biased towards doing so.
# If you cannot explicitly defend inheritance as a better solution, use composition. Composition contains far fewer built-in dependencies than inheritance; it is very often the best choice.

# Inheritance is a better solution when its use provides high rewards for low risk.

## Benefits of Inheritance

# Changes made to these methods ripple down the inheritance tree. Correctly modeled hierarchies are thus extremely reasonable; big changes in behavior can be achieved via small changes in code.
# Use of inheritance results in code that can be described as open–closed; hierarchies are open for extension while remaining closed for modification. Adding a new sub- class to an existing hierarchy requires no changes to existing code. Hierarchies are thus usable; you can easily create new subclasses to accommodate new variants.
# Correctly written hierarchies are easy to extend. The hierarchy embodies the abstraction and every new subclass plugs in a few concrete differences. The existing pattern is easy to follow and replicating it will be the natural choice of any program- mer charged with creating new subclasses. Hierarchies are therefore exemplary; by their nature they provide guidance for writing the code to extend them.

## Costs of Inheritance

# The first fear is that you might be fooled into choosing inheritance to solve the wrong kind of problem.
# Second, even when inheritance makes sense for the problem, you might be writ- ing code that will be used by others for purposes you did not anticipate.

# The flip side of the reasonable coin is the very high cost of making changes near the top of an incorrectly modeled hierarchy. In this case, the leveraging effect works to your disadvantage; small changes break everything.
# The opposing side of the usable coin is the impossibility of adding behavior when new subclasses represent a mixture of types. The Bicycle hierarchy in Chapter 6 failed when the need for recumbent mountain bikes appeared. This hierarchy already contains subclasses for MountainBike and RecumbentBike; combining the qualities of these two classes into a single object is not possible in the hierarchy as it currently exists. You cannot reuse existing behavior without changing it.
# The other side of the exemplary coin is the chaos that ensues when novice pro- grammers attempt to extend incorrectly modeled hierarchies. These inadequate hierarchies should not be extended, they need to be refactored, but novices do not have the skills to do so. Novices are forced to duplicate existing code or to add dependencies on class names, both of which serve to exacerbate existing design problems.

## Benefits of Composition

# These small objects have a single responsibility and specify their own behavior. They are transparent; it’s easy to understand the code and it’s clear what will happen if it changes. Also, the composed object’s independence from the hierarchy means that it inherits very little code and so is generally immune from suffering side effects as a result of changes to classes above it in the hierarchy.
# Because composed objects deal with their parts via an interface, adding a new kind of part is a simple matter of plugging in a new object that honors the interface. From the point of view of the composed object, adding a new variant of an existing part is reasonable and requires no changes to its code.
# By their very nature, objects that participate in composition are small, structurally independent, and have well-defined interfaces. This allows their seamless transition into pluggable, interchangeable components. Well-composed objects are therefore easily usable in new and unexpected contexts.

## Costs of Composition

# A composed object relies on its many parts. Even if each part is small and easily understood, the combined operation of the whole may be less than obvious. While
# every individual part may indeed be transparent, the whole may not be.
# The benefits of structural independence are gained at the cost of automatic mes- sage delegation. The composed object must explicitly know which messages to delegate and to whom. Identical delegation code may be needed by many different objects;
# composition provides no way to share this code.

# Inheritance is specialization.

# Inheritance is best suited to adding functionally to existing classes when you will use most of the old code and add relatively small amounts of new code.

# Use composition when the behavior is more than the sum of its parts.

# Use Inheritance for is-a Relationships
# Use Duck Types for behaves-like-a Relationships
# Use Composition for has-a Relationships

# For every problem, assess the costs and benefits of alternative design techniques and use your judgment and experience to make the best choice.

# Summary

# Composition allows you to combine small parts to create more complex objects such that the whole becomes more than the sum of its parts. Composed objects tend to consist of simple, discrete entities that can easily be rearranged into new combinations. These simple objects are easy to understand, reuse, and test, but because they combine into a more complicated whole, the operation of the bigger application may not be as easy to understand as that of the individual parts.
# Composition, classical inheritance, and behavior sharing via modules are competing techniques for arranging code. Each has different costs and benefits; these differences predispose them to be better at solving slightly different problems.
# These techniques are tools, nothing more, and you’ll become a better designer if you practice each of them. Learning to use them properly is a matter of experience and judgment, and one of the best ways to gain experience is to learn from your own mistakes. The key to improving your design skills is to attempt these techniques, accept your errors cheerfully, remain detached from past design decisions, and refactor mercilessly.
# As you gain experience, you’ll get better at choosing the correct technique the first time, your costs will go down, and your applications will improve.
