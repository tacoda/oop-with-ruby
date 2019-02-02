# An object has a dependency when it knows
# - The name of another class. Gear expects a class named Wheel to exist.
# - The name of a message that it intends to send to someone other than self. Gear expects a Wheel instance to respond to diameter.
# - The arguments that a message requires. Gear knows that Wheel.new requires a rim and a tire.
# - The order of those arguments. Gear knows the first argument to Wheel.new should be rim, the second, tire.

class Gear
  attr_reader :chainring, :cog, :wheel

  # avoid fixed order arguments with a hash
  def initialize(args)
    # Using fetch
    # @chainring = args.fetch(:chainring, 40]
    # @cog = args.fetch(:cog, 18)
    # @wheel = args[:wheel]

    # Using default merge
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def defaults
    { chainring: 40, cog: 18 }
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

wheel = Wheel.new(26, 1.5)
puts Gear.new({
  chainring: 52,
  cog: 11,
  wheel: wheel
  }).gear_inches
# puts Gear.new(52, 11).ratio

# Inject Dependencies

# Depend on things that change less often than you do

# Dependency management is core to creating future-proof applications.
# Injecting dependencies creates loosely coupled objects that can be
# reused in novel ways. Isolating dependencies allows objects to quickly
# adapt to unexpected changes. Depending on abstractions decreases the
# likelihood of facing these changes.
# The key to managing dependencies is to control their direction. The road
# to maintenance nirvana is paved with classes that depend on things that
# change less often than they do.
