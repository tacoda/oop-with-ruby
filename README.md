# Practical Object-Oriented Design in Ruby

## Single Responsibility

### Takeaways

The path to changeable and maintainable object-oriented software
begins with classes that have a single responsibility. Classes that
do one thing isolate that thing from the rest of your application.
This isolation allows change without consequence and reuse without
duplication.

Classes should be __TRUE__:

- Transparent: _consequences of change should be obvious_
- Reasonable: _cost of any change should be proportional to the benefits_
- Usable: _existing code should be usable in new and unexpected contexts_
- Exemplary: _should encourage those who change it to perpetuate these qualities_

A class should do the smallest possible useful thing; that is, it should have
a single responsibility.

SRP applies to methods too
Preserve your ability to make a decision later
Postpone design decisions until you are absolutely force to make them

Appliations that are easy to change consist of classes that are easy to reuse.

Interrogate a class to determine if it has a single responsiblity:

_"[Class], what is your [method]?"_

_"[Class], please do [method]."_

### Techniques

- Depend on behavior, not data
  - Hide instance variables
  - Hide data structures
- Enforce single responsbility everywhere
  - Extract extra responsibilities from methods
  - Isolate extra responsbilities in classes

Methods that follow SRP have the following benefits:

- Expose previously hidden qualities
- Avoid the need for comments
- Encourage reuse
- Are easy to move to another class

## Managing Depedencies

### Takeaways

An object has a dependency when it knows:

- The name of another class
- The name of a message that it intends to send to someone other than self
- The arguments that a message requires
- The order of those arguments

Dependencies tie classes together

Choosing dependency direction:

- Some classes are more likely than others to have changes in their requirements
- Concrete classes are more likely to change than abstract classes
- Changing a class that has many dependents will result in widespread consequences

_Depend on things that change less than you do_

### Techniques

- Inject dependencies
  - Parameterize them to inject them
- Isolate dependencies
  - Isolate instance creation
    Wrap initialization
  - Isolate vulnerable external messages
    Wrap calls to things other than self
- Remove argument-order dependencies
  - Explicitly define defaults
    In initialize
    Break out defaults method
  - Isolate multiparameter initialization
    Wrap the class interface in a module interface to protect from changes
- Reversing dependencies
  Swap service and client roles
- Choosing dependency direction
  - Understanding likelihood of change
  - Recognizing concretions and abstractions
  - Avoiding dependent-laden classes
  - Finding the dependenices that matter

## Flexible Interfaces

### Takeaways

_Programs are made up of classes, but defined by messages._

Public interfaces:

- Reveal its primary responsibility
- Are expected to be invoked by others
- Will not change on a whim
- Are safe for others to depend on
- Are thoroughly documented in the tests

Private interfaces:

- Handle implementation details
- Are not expected to be send by other objects
- Can change for any reason whatsoever
- Are unsafe for others to depend on
- May not even be referenced in the tests

Finding an interface:

- Constructing an intention
  Domain objects: nouns
  Don't focus on the domain objects, but on the messages that pass between them
  Messages are guides to lead you to discover other objects
- Using sequence diagrams
  Should Class be responsible for doing method?
- Ask for what instead of telling how
- Seek context independence
- Trust other objects
- Use messages to discover objects
- Create a message-based application

### Techniques

- Create explicit interfaces
- Honor the public interfaces of others
- Methods in the public interface should
  - Be explicitly defined
  - Be more about what than how
  - Have names that will not change easily
  - Take a hash as an options parameter
- Exercise caution when depending on private interfaces
- Minimize context
- Law of Demeter
  - A set of coding rules that results in loosely coupled objects
  - Only talk to your immediate neighbors
  - Applies to types
- Consequences of violations
  - Your classes will fail to be TRUE
- Avoiding violations
  - Can use delegation, but this really hides it
- Listening to Demeter
  
The train wrecks of Demeter violations are clues that there are objects whose
public interfaces are lacking. Listening to Demeter means paying attention to your
point of view. If you shift to a message-based perspective, the messages you find will
become public interfaces in the objects they lead you to discover.

Object-oriented applications are defined by the messages that pass between objects.
This message passing takes place along “public” interfaces; well-defined public
interfaces consist of stable methods that expose the responsibilities of their underlying
classes and provide maximal benefit at minimal cost.

Focusing on messages reveals objects that might otherwise be overlooked. When
messages are trusting and ask for what the sender wants instead of telling the receiver
how to behave, objects naturally evolve public interfaces that are flexible and reusable
in novel and unexpected ways.

## Duck Typing

### Takeaways

### Techniques

## Acquiring Behavior through Inheritance

### Takeaways

### Techniques

## Sharing Behavior with Modules

### Takeaways

### Techniques

## Object Composition

### Takeaways

### Techniques

## Cost-Effective Tests

### Takeaways

### Techniques

