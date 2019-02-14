# Sharing role behavior with Modules

# Behavior orthogonal to class
# It's a role an object plays

# Methods can be defined in a module
# and the module can be added to any class

# The total set of messages to which an object can respond includes
# - Those it implements
# - Those implemented in all objects above it in the hierarchy
# - Those implemented in any module that has been added to it
# - Those implemented in all modules added to any object above it in the hierarchy

# Modules mix-in behavior
# They play a similar role as interfaces
# But you must provide and implementation

module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  def lead_days
    0
  end
end

class Schedule
  def scheduled?(schedulable, starting, ending)
    puts "This #{schedulable.class} " +
          "is not scheduled\n" +
          " between #{starting} and #{ending}"
    false
  end

  def add(target, starting, ending)
    false
  end

  def remove(target, starting, ending)
    false
  end
end

class Bicycle
  include Schedulable

  def lead_days
    1
  end
end

class Vehicle
  include Schedulable

  def lead_days
    3
  end
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
puts b.schedulable?(starting, ending)

v = Vehicle.new
puts v.schedulable?(starting, ending)

m = Mechanic.new
puts m.schedulable?(starting, ending)

## Antipatterns

# An object that uses a variable with a name like type or category to determine what message to send to self contains two highly related but slightly different types
# When a sending object checks the class of a receiving object to deter- mine what message to send, you have overlooked a duck type
# In addition to sharing an interface, duck types might also share behavior. When they do, place the shared code in a module and include that module in each class or object that plays the role.

# All of the code in an abstract superclass should apply to every class that inherits it. Superclasses should not contain code that applies to some, but not all, subclasses. This restriction also applies to modules: the code in a module must apply to all who use it.
# The fundamental coding technique for creating inheritable code is the template method pattern.
# This pattern is what allows you to separate the abstract from the con- crete. The abstract code defines the algorithms and the concrete inheritors of that abstraction contribute specializations by overriding these template methods.
# Avoid writing code that requires its inheritors to send super; instead use hook mes- sages to allow subclasses to participate while absolving them of responsibility for knowing the abstract algorithm.

# Shallow, narrow hierarchies are easy to understand.
# Shallow, wide hierarchies are slightly more complicated.
# Deep, narrow hierarchies are a bit more challenging and unfortunately have a natural tendency to get wider, strictly as a side effect of their depth.
# Deep, wide hierarchies are difficult to understand, costly to maintain, and should be avoided.

# Summary

# When objects that play a common role need to share behavior, they do so via a Ruby module. The code defined in a module can be added to any object, be it an instance of a class, a class itself, or another module.
# When a class includes a module, the methods in that module get put into the same lookup path as methods acquired via inheritance.
# Because module methods and inher- ited methods interleave in the lookup path, the coding techniques for modules mirror those of inheritance.
# Modules, therefore, should use the template method pattern to invite those that include them to supply specializations, and should implement hook methods to avoid forcing includers to send super (and thus know the algorithm).
# When an object acquires behavior that was defined elsewhere, regardless of whether this elsewhere is a superclass or an included module, the acquiring object makes a commitment to honoring an implied contract.
# This contract is defined by the Liskov Substitution Principle, which in mathematical terms says that a subtype should be substitutable for its supertype, and in Ruby terms this means that an object should act like what it claims to be.
