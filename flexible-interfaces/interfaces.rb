# Public Interfaces
# The methods that make up the public interface of your class
# comprise the face it presents to the world. They:
#
# - Reveal its primary responsibility
# - Are expected to be invoked by others
# - Will not change on a whim
# - Are safe for others to depend on
# - Are thoroughly documented in the tests
#
# Private Interfaces
# All other methods in the class are part of its private interface. They:
#
# - Handle implementation details
# - Are not expected to be sent by other objects
# - Can change for any reason whatsoever
# - Are unsafe for others to depend on
# - May not even be referenced in the tests

# Sequence diagrams help with initial design (use this mainly)
# and UML class diagrams and Database diagrams
#
# Therein lies the value of sequence diagrams. They explicitly
# specify the messages that pass between objects, and because
# objects should only communicate using public interfaces, sequence
# diagrams are a vehicle for exposing, experimenting with, and
# ultimately defining those interfaces.
#
# Suddenly, the conversation has changed; it is now revolving around
# messages. Instead of deciding on a class and then figuring out its
# responsibilities, you are now deciding on a message and figuring out
# where to send it.
#
# The message-based perspective yields more flexible applications than
# does the class-based perspective. Changing the fundamental design
# question from "I know I need this class, what should it do?" to
# "I need to send this message, who should respond to it?" is the
# first step in that direction.
#
# You don't send messages because you have objects,
# you have objects because you send messages.

# Ask for WHAT, don't tell HOW

# Sequence Diagrams are useful. They help keep the focus on messages
# and allow you to form a rational intention about the first thing to
# assert in a test. Switching your attention from objects to messages
# allows you to concentrate on designing an application built upon
# public interfaces.

# Use messages to discover objects

# Think about interfaces. Create them intentionally. It is your interfaces,
# more than all of your tests and any of your code, that define your application
# and determine its future.

# Rules of Thumb for Creating Interfaces

## Create Explicit Interfaces
# Methods in a public interface should
# - Be explicitly identified as such
# - Be more about what than how
# - Have names that, insofar as you can anticipate, will not change
# - Take a hash as an options parameter

## Honor the Public Interfaces of Others
# A dependency on a private method is a form of technical debt.
# Avoid these dependencies.

## Exercise Caution When Depending on Private Interfaces

## Minimize Context
# Construct public interfaces with an eye toward minimizing the context they
# require from others. Keep the what versus how distinction in mind; create
# public methods that allow senders to get what they want without knowing how
# your class implements its behavior.

# Depending on how often you plan to use this new public interface, it can be
# a new method that you define and place in the Mechanic class, a new wrapper
# class that you create and use instead of Mechanic, or a single wrapping method
# that you place in your own class. Do what best suits your needs, but create
# some kind of defined public interface and use it. This reduces your class’s
# context, making it easier to reuse and simpler to test.

# The Law of Demeter
# Only talk to your immediate neighbors
# As you can see, Demeter is more subtle than first appears. Its fixed rules
# are not an end in themselves; like every design principle, it exists in
# service of your overall goals. Certain “violations” of Demeter reduce your
# application’s flexibility and maintainability, while others make perfect sense.

# Delegation is tempting as a solution to the Demeter problem because it removes
# the visible evidence of violations. This technique is sometimes useful, but
# beware, it can result in code that obeys the letter of the law while ignoring
# its spirit.
# Using delegation to hide tight coupling is not the same as decoupling the code.

# The train wrecks of Demeter violations are clues that there are objects whose
# public interfaces are lacking. Listening to Demeter means paying attention to
# your point of view. If you shift to a message-based perspective, the messages
# you find will become public interfaces in the objects they lead you to discover.
# However, if you are bound by the shackles of existing domain objects, you’ll
# end up assembling their existing public interfaces into long message chains
# and thus will miss the opportunity to find and construct flexible public
# interfaces.

# Summary

# Object-oriented applications are defined by the messages that pass between
# objects. This message passing takes place along “public” interfaces;
# well-defined public interfaces consist of stable methods that expose the
# responsibilities of their underlying classes and provide maximal benefit at
# minimal cost.

# Focusing on messages reveals objects that might otherwise be overlooked.
# When messages are trusting and ask for what the sender wants instead of
# telling the receiver how to behave, objects naturally evolve public interfaces
# that are flexible and reusable in novel and unexpected ways.
