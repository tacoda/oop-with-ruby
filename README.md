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

### Techniques

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

