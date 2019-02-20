# Designing Cost-Effective Tests

# Writing changeable code is an art whose practice relies on three different skills.
# First, you must understand object-oriented design. Poorly designed code is naturally difficult to change.
# Second, you must be skilled at refactoring code.

# Refactoring is the process of changing a software system in such a way that it
# does not alter the external behavior of the code yet improves the internal structure.

# Finally, the art of writing changeable code requires the ability to write high-value tests.
# Tests give you confidence to refactor constantly.
# Efficient tests prove that altered code continues to behave correctly without raising overall costs.
# Good tests weather code refactorings with aplomb; they are written such that changes to the code do not force rewrites of the tests.

# An understanding of object-oriented design, good refactoring skills, and the ability to write efficient tests form a three-legged stool upon which changeable code rests. Well-designed code is easy to change, refactoring is how you change from one design to the next, and tests free you to refactor with impunity.

# Intentional Testing

# The most common arguments for having tests are that they reduce bugs and provide documentation, and that writing tests first improves application design.
# These benefits, however valid, are proxies for a deeper goal. The true purpose of testing, just like the true purpose of design, is to reduce costs.

# Getting good value from tests requires clarity of intention and knowing what, when, and how to test.

# Knowing Your Intentions

## Finding Bugs

# Finding faults, or bugs, early in the development process yields big dividends. Not only is it easier to find and fix a bug nearer in time to its creation, but getting the code right earlier rather than later can have unexpected positive effects on the resulting design.
# Also, as code accumulates, embedded bugs acquire dependencies. Fixing these bugs late in the process may necessitate changing a lot of dependent code. Fixing bugs early always lowers costs.

## Supplying Documentation

# Tests provide the only reliable documentation of design.
# Remember that you will forget; write tests that remind you of the story once you have.

## Deferring Design Decisions

# Tests allow you to safely defer design decisions. As your design skills improve you will begin to write applications that are sprinkled with places where you know the design needs something but you don’t yet have enough information to know exactly what.
# This situation occurs when you are aware of just one concrete case in the present but you fully expect new cases to arrive in the near future. You know that at some point you will be better served by code that handles these many concrete cases as a single abstraction, but right now you don’t have enough information to anticipate what that abstraction will be.
# When your tests depend on interfaces you can refactor the underlying code with reckless abandon. The tests verify the continued good behavior of the interface and changes to the underlying code do not force rewrites of the tests. Intentionally depending on interfaces allows you to use tests to put off design decisions safely and without penalty.

## Supporting Abstractions

# Good design naturally progresses toward small independent objects that rely on abstractions. The behavior of a well-designed application gradually becomes the result of interactions among these abstractions. Abstractions are wonderfully flexible design components but the improvements they provide come at one slight cost: While each individual abstraction might be easy to understand, there is no single place in the code that makes obvious the behavior of the whole.
# As the code base expands and the number of abstractions grows, tests become increasingly necessary. There is a level of design abstraction where it is almost impossi- ble to safely make any change unless the code has tests. Tests are your record of the interface of every abstraction and as such they are the wall at your back. They let you put off design decisions and create abstractions to any useful depth.

## Exposing Desing Flaws

# The next benefit of tests is that they expose design flaws in the underlying code. If a test requires painful setup, the code expects too much context. If testing one object drags a bunch of others into the mix, the code has too many dependencies. If the test is hard to write, other objects will find the code difficult to reuse.
# Tests are the canary in the coal mine; when the design is bad, testing is hard.
# For tests to lower your costs, both the underlying application and the tests must be well-designed.
# Your goal is to gain all of the benefits of testing for the least cost possible. The best way to achieve this goal is to write loosely coupled tests about only the things that matter.

# Knowing What to Test

# One simple way to get better value from tests is to write fewer of them. The safest way to accomplish this is to test everything just once and in the proper place.
# Removing duplication from testing lowers the cost of changing tests in reaction to application changes, and putting tests in the right place guarantees they’ll be forced to change only when absolutely necessary. Distilling your tests to their essence requires having a very clear idea about what you intend to test, one that can be derived from design principles you already know.
# Well-designed objects have boundaries that are very strong.
# This willful ignorance of the internals of every other object is at the core of design. Dealing with objects as if they are only and exactly the messages to which they respond lets you design a changeable application, and it is your understanding of the impor- tance of this perspective that allows you to create tests that provide maximum benefit at minimum cost.
# The design principles you are enforcing in your application apply to your tests as well. Each test is merely another application object that needs to use an existing class. The more the test gets coupled to that class, the more entangled the two become and the more vulnerable the test is to unnecessarily being forced to change.
# Not only should you limit couplings, but the few you allow should be to stable things. The most stable thing about any object is its public interface; it logically follows that the tests you write should be for messages that are defined in public interfaces.
# The most costly and least useful tests are those that blast holes in an object’s containment walls by coupling to unstable internal details. These over-eager tests prove nothing about the overall correctness of an application but nonetheless raise costs because they break with every refactoring of underlying class.
# Tests should concentrate on the incoming or outgoing messages that cross an object’s boundaries. The incoming messages make up the public interface of the receiving object. The outgoing messages, by definition, are incoming into other objects and so are part of some other object’s interface.

# The general rule is that objects should make assertions about state only for messages in their own public interfaces. Following this rule confines tests of message return values to a single place and removes unneces- sary duplication, DRYing out your tests and lowering maintenance costs.

# Some outgoing messages have no side effects and thus matter only to their senders.
# Outgoing messages like this are known as queries and they need not be tested by the sending object. Query messages are part of the public interface of their receiver, which already implements every necessary test of state.
# However, many outgoing messages do have side effects upon which your application depends. These messages are commands and it is the responsibility of the sending object to prove that they are properly sent. Proving that a message gets sent is a test of behavior, not state, and involves assertions about the number of times, and with what arguments, the message is sent.

# Incoming messages should be tested for the state they return. Outgoing command messages should be tested to ensure they get sent. Outgoing query messages should not be tested.
# As long as your application’s objects deal with one another strictly via public interfaces, your tests need know nothing more. When you test this minimal set of messages, no change in the private behavior of any object can affect any test. When you test outgoing command messages only to prove they get sent, your loosely coupled tests can tolerate application changes without being forced to change in turn.
# As long as the public interfaces remain stable, you can write tests once and they will keep you safe forever.

# Knowing When to Test

# Writing tests first forces a modicum of reusability to be built into an object from its inception; it would otherwise be impossible to write tests at all.
# The gains accrued from forced reuse are ones they already have.
# It is not unheard of for experienced designers to “spike” a problem, that is, to do experiments where they just write code. These experiments are exploratory, for prob- lems about whose solution they are uncertain. Once clarity is gained and a design sug- gests itself, these programmers then revert to test-first for production code.
# Your overall goal is to create well-designed applications that have acceptable test coverage. The best way to reach this goal varies according to the strengths and experience of the programmer.

# Knowing How to Test

# MiniTest
# RSpec

# TDD and BDD
# Both styles create code by writing tests first. BDD takes an outside-in approach, creating objects at the boundary of an application and working its way inward, mock- ing as necessary to supply as-yet-unwritten objects. TDD takes an inside-out ap- proach, usually starting with tests of domain objects and then reusing these newly created domain objects in the tests of adjacent layers of code.

# MiniTest Framework

# Testing Incoming Messages

# Deleting Unused Interfaces

# class Wheel
#   attr_reader :rim, :tire
#   def initialize(rim, tire)
#     @rim = rim
#     @tire = tire
#   end
#
#   def diameter
#     rim + (tire * 2)
#   end
# end

# class Gear
#   attr_reader :chainring, :cog, :wheel
#   def initialize(args)
#     @chainring = args[:chainring]
#     @cog = args[:cog]
#     @wheel = args[:wheel]
#   end
#
#   def gear_inches
#     ratio * wheel.diameter
#   end
#
#   def ratio
#     chainring / cog.to_f
#   end
# end

# Command Messages Illustration
# class Gear
#   attr_reader :chainring, :cog, :observer
#   def initialize(args)
#     @chainring = args[:chainring]
#     @cog = args[:cog]
#     @observer = args[:observer]
#   end
#
#   def set_cog(new_cog)
#     @cog = new_cog
#     changed
#   end
#
#   def set_chainring(new_chainring)
#     @chainring = new_chainring
#     changed
#   end
#
#   def changed
#     observer.changed(chainring, cog)
#   end
# end
#
# # Test Double
# class DiameterDouble
#   # Method Stub
#   def diameter
#     10
#   end
# end

## Proving the Public Interface

# require 'minitest/autorun'
# class WheelTest < MiniTest::Unit::TestCase
#   def setup
#     @wheel = Wheel.new(26, 1.5)
#   end
#
#   def test_implements_the_diameterizable_interface
#     assert_respond_to(@wheel, :diameter)
#   end
#
#   def test_calculates_diameter
#     wheel = Wheel.new(26, 1.5)
#     assert_in_delta(29,
#                     wheel.diameter,
#                     0.01)
#   end
# end

# class GearTest < MiniTest::Unit::TestCase
#   def test_calculates_gear_inches
#     gear = Gear.new(
#               chainring: 52,
#               cog: 11,
#               wheel: DiameterDouble.new )
#     assert_in_delta(47.27,
#                     gear.gear_inches,
#                     0.01)
#   end
# end

# Command Messages Illustration
# class GearTest < MiniTest::Unit::TestCase
#   def setup
#     @observer = MiniTest::Mock.new
#     @gear = Gear.new(
#               chainring: 52,
#               cog: 11,
#               observer: @observer )
#   end
#
#   def test_notifies_observers_when_cogs_change
#     @observer.expect(:changed, true, [52, 27])
#     @gear.set_cog(27)
#     @observer.verify
#   end
#
#   def test_notifies_observers_when_chainrings_change
#     @observer.expect(:changed, true, [42, 11])
#     @gear.set_chainring(42)
#     @observer.verify
#   end
# end

# The fact that Gear's gear_inches method creates and uses another object affects how long this test runs and how likely it is to suffer unintended consequences as a result of changes to unrelated parts of the application.
# The coupling that creates this problem, however, is hidden inside of Gear and so totally invisible in this test. The test’s purpose is to prove that gear_inches returns the right result and it cer- tainly fulfills that requirement, but the way the underlying code is structured adds hidden risk.
# If Wheels are expensive to create, the Gear test pays that cost even though it has no interest in Wheel. If Gear is correct but Wheel is broken, the Gear test might fail in a misleading way, at a place far distant from the code you’re trying to test.
# When tightly coupled objects are tested, a test of one object runs code in many others. If the code were such that Wheel were also coupled to other objects, this problem is magnified; running the Gear test would then create a large network of objects, any of which might break in a maddeningly confusing way.

# Isolating the Object Under Test

# Recognize hidden complexity and concrete classes

# Injecting Dependencies Using Class

# Create wheel class and inject it into Gear

# Injecting Dependences as Roles

# Create a test double
# One way to raise the role's visibility is to assert that Wheel plays it.
# However, it is not satisfactory
# First, it cannot be shared with other Diameterizables. Other players of this role would have to duplicate this test. Next, it does nothing to help with the "living the dream" problem from the Gear test. Wheel's assertion that it plays this role does not prevent Gear's DiameterDouble from becoming obsolete and allowing the gear_inches test to erroneously pass.
# Solution in Proving the Correctness of Ducks

# Tests do not prevent you from writing Wheel and then embedding the creation of a Wheel deep inside of Gear.
# This coupling doesn't make tests impossible, it just raises costs.
# Reducing the coupling is up to you and relies on your understanding of the principles of design.

## Testing Private Methods

# Ignoring Private Methods During Tests

# Your tests should hide private methods, not expose them.

# Removing Private Methods from the Class Under Test

# One way to sidestep this entire problem is to avoid private methods altogether.
# It is costly to couple to unstable methods regardless of whether they are portrayed as public or private.

# Choosing to Test a Private Method

# Times of great uncertainly call for drastic measures. It is therefore occasionally defen- sible to fling a bit of smelly code into place and hide the mess until better information arrives. Hiding messes is easily done; just wrap the offending code in a private method.
# If you create a mess and never fix it your costs will eventually go up, but in the short term, for the right problem, having enough confidence to write embarrassing code can save money.
# When your intention is to defer a design decision, do the simplest thing that solves today's problem. Isolate the code behind the best interface you can conceive and hunker down and wait for more information.

# The rules-of-thumb for testing private methods are thus:
# Never write them, and if you do, never ever test them, unless of course it makes sense to do so.
# Therefore, be biased against writing these tests but do not fear to do so if this would improve your lot.

## Testing Outgoing Messages

# Ignoring Query Messages

# In the same way that tests should ignore messages sent to self, they also should ignore outgoing query messages. The consequences of sending diameter are hidden inside of Gear. Because the overall application does not need this message to be sent, your tests need not care.
# Gear's gear_inches method depends on the result that diameter returns, but tests to prove the correctness of diameter belong in Wheel, not here in Gear. It is redundant for Gear to duplicate those tests, maintenance costs will increase if it does. Gear's only responsibility is to prove that gear_inches works correctly and it can do this by simply testing that gear_inches always returns appropriate results.

# Proving Command Messages

# Sometimes, however, it does matter that a message get sent; other parts of your application depend on something that happens as a result. In this case the object under test is responsible for sending the message and your tests must prove it does so.
# Not only should they prove it, but they also should do so without making assertions about the result that observer's changed method returns. Just as Wheel's tests claimed sole responsibility for making assertions about the results of its own diameter method, observer's tests are responsible for making assertions about the results of its changed method. The responsibility for testing a message's return value lies with its receiver. Doing so anywhere else duplicates tests and raises costs.
# To avoid duplication you need a way to prove that Gear sends changed to observer that does not force you to rely on checking what comes back when it does. Fortunately, this is easy; you need a mock. Mocks are tests of behavior, as opposed to tests of state. Instead of making assertions about what a message returns, mocks define an expectation that a message will get sent.

## Testing Duck Types

# Testing Roles

# class Mechanic
#   def prepare_trip(trip)
#     trip.bicycles.each {|bicycle|
#       prepare_bicycle(bicycle) }
#   end
#
#   def prepare_bicycle(bicycle)
#   end
# end
#
# class TripCoordinator
#   def prepare_trip(trip)
#     buy_food(trip.customers)
#   end
#
#   def buy_food(customers)
#   end
# end
#
# class Driver
#   def prepare_trip(trip)
#     vehicle = trip.vehicle
#     gas_up(vehicle)
#     fill_water_tank(vehicle)
#   end
#
#   def gas_up(vehicle)
#   end
#
#   def fill_water_tank(vehicle)
#   end
# end
#
# class Trip
#   attr_reader :bicycles, :customers, :vehicle
#
#   def prepare(preparers)
#     preparers.each {|preparer|
#       preparer.prepare_trip(self) }
#   end
# end
#
# require 'minitest/autorun'
#
# # Testing Incoming Message
#
# module PreparerInterfaceTest
#   def test_implements_the_preparer_interface
#     assert_respond_to(@object, :prepare_trip)
#   end
# end
#
# class MechanicTest < MiniTest::Unit::TestCase
#   include PreparerInterfaceTest
#
#   def setup
#     @mechanic = @object = Mechanic.new
#   end
# end
#
# class TripCoordinatorTest < MiniTest::Unit::TestCase
#   include PreparerInterfaceTest
#
#   def setup
#     @trip_coordinator = @object = TripCoordinator.new
#   end
# end
#
# class DriverTest < MiniTest::Unit::TestCase
#   include PreparerInterfaceTest
#
#   def setup
#     @driver = @object = Driver.new
#   end
# end

# Testing Outgoing Message

# class TripTest < MiniTest::Unit::TestCase
#   def test_requests_trip_preparation
#     @preparer = MiniTest::Mock.new
#     @trip = Trip.new
#     @preparer.expect(:prepare_trip, nil, [@trip])
#     @trip.prepare([@preparer])
#     @preparer.verify
#   end
# end

# Using Roles Tests to Validate Doubles

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def width
    rim + (tire * 2)
  end
end

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * wheel.width
  end

  def ratio
    chainring / cog.to_f
  end
end

# Test Double
class DiameterDouble
  # Method Stub
  def width
    10
  end
end

require 'minitest/autorun'

# The first step in solving the problem is to extract test_implements_the_diameterizable_interface from Wheel into a module of its own:

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :width)
  end
end

class WheelTest < MiniTest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(26, 1.5)
  end

  # def test_implements_the_diameterizable_interface
  #   assert_respond_to(@wheel, :width)
  # end

  # def test_calculates_diameter
  #   wheel = Wheel.new(26, 1.5)
  #   assert_in_delta(29,
  #                   wheel.diameter,
  #                   0.01)
  # end
end

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
              chainring: 52,
              cog: 11,
              wheel: DiameterDouble.new )
    assert_in_delta(47.27,
                    gear.gear_inches,
                    0.01)
  end
end

# Now that the test is in a module, we can reuse it
# Plus we get visibility on our error
class DiameterDoubleTest < MiniTest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
  end
end

## Testing Inherited Code

class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end

  def spares
    { tire_size: tire_size,
      chain: chain}.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MountainBike < Bicycle
  def default_tire_size
    '2.1'
  end
end

# Easiest way to prove a hierarchy adheres to LSP
# is to write a shared test for the common contract
module BicycleInterfaceTest
  def test_responds_to_default_tire_size
    assert_respond_to(@object, :default_tire_size)
  end

  def test_responds_to_default_chain
    assert_respond_to(@object, :default_chain)
  end

  def test_responds_to_chain
    assert_respond_to(@object, :chain)
  end

  def test_responds_to_size
    assert_respond_to(@object, :size)
  end

  def test_responds_to_tire_size
    assert_respond_to(@object, :tire_size)
  end

  def test_responds_to_spares
    assert_respond_to(@object, :spares)
  end
end

# To test abstract superclass behavior, make a subclass to use in the test
class StubbedBike < Bicycle
  def default_tire_size
    0
  end

  def local_spares
    {saddle: 'painful'}
  end
end

class BicycleTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest

  def setup
    @bike = @object = Bicycle.new({tire_size: 0})
    @stubbed_bike = StubbedBike.new
  end

  # Confirming superclass enforcement
  def test_forces_subclasses_to_implement_default_tire_size
    assert_raises(NotImplementedError) {@bike.default_tire_size}
  end

  # Confirming abstract superclass behavior
  def test_includes_local_spares_in_spares
    assert_equal @stubbed_bike.spares,
                { tire_size: 0,
                  chain: '10-speed',
                  saddle: 'painful' }
  end
end

# class RoadBikeTest < MiniTest::Unit::TestCase
#   include BicycleInterfaceTest
#
#   def setup
#     @bike = @object = RoadBike.new
#   end
# end

## Specifying Subclass Responsiblities

# They should share a common test to prove that
# each subclass meets the requirements
module BicycleSubclassTest
  def test_responds_to_post_initialize
    assert_respond_to(@object, :post_initialize)
  end

  def test_responds_to_local_spares
    assert_respond_to(@object, :local_spares)
  end

  def test_responds_to_default_tire_size
    assert_respond_to(@object, :default_tire_size)
  end
end

# If you fear that StubbedBike will become obsolete and permit BicycleTest to pass when it should fail, the solution is close at hand.
#  There is already a common BicycleSubclassTest. Just as you used the Diameterizable InterfaceTest to guarantee DiameterDouble’s continued good behavior, you can use BicycleSubclassTest to ensure the ongoing correctness of StubbedBike.
# Add the following code
class StubbedBikeTest < MiniTest::Unit::TestCase
  include BicycleSubclassTest

  def setup
    @object = StubbedBike.new
  end
end

class RoadBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  include BicycleSubclassTest

  def setup
    @bike = @object = RoadBike.new(tape_color: 'red')
  end

  # Testing Unique Behavior
  def test_puts_tape_color_in_local_spares
    assert_equal 'red', @bike.local_spares[:tape_color]
  end
end

class MountainBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  include BicycleSubclassTest

  def setup
    @bike = @object = MountainBike.new
  end
end

# Carefully written inheritance hierarchies are easy to test. Write one shareable test for the overall interface and another for the subclass responsibilities.
# Diligently isolate responsibilities. Be especially careful when testing subclass specializations to prevent knowledge of the superclass from leaking down into the subclass's test.
# Testing abstract superclasses can be challenging; use the Liskov Substitution Principle to your advantage. If you leverage Liskov and create new subclasses that are used exclusively for testing,
# consider requiring these subclasses to pass your subclass responsibility test to ensure they don't accidentally become obsolete.

## Summary

# Tests are indispensable. Well-designed applications are highly abstract and under constant pressure to evolve; without tests these applications can neither be understood nor safely changed.
# The best tests are loosely coupled to the underlying code and test everything once and in the proper place. They add value without increasing costs.
# A well-designed application with a carefully crafted test suite is a joy to behold and a pleasure to extend. It can adapt to every new circumstance and meet any unexpected need.
