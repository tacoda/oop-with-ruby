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

_"Class, what is your method?"_

### Techniques

- Depend on behavior, not data
  - Hide instance variables
  - Hide data structures

## Managing Depedencies

### Takeaways

### Techniques

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

