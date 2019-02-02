# class Gear
#   attr_reader :chainring, :cog, :wheel
#   def initialize(chainring, cog, rim, tire)
#     @chainring = chainring
#     @cog = cog
#     @wheel = Wheel.new(rim, tire)
#   end
#
#   def ratio
#     chainring / cog.to_f
#   end
#
#   def gear_inches
#     ratio * wheel.diameter
#   end
#
#   # SRP applies to methods too
#   # Preserve your ability to make a decision later
#   # Postpone design decisions until you are absolutely force to make them
#   Wheel = Struct.new(:rim, :tire) do
#     def diameter
#       rim + (tire * 2)
#     end
#   end
# end
#
# # puts Gear.new(52, 11).ratio
# # puts Gear.new(30, 27).ratio
# puts Gear.new(52, 11, 26, 1.5).gear_inches
# puts Gear.new(30, 27, 24, 1.25).gear_inches

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
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
puts wheel.circumference

puts Gear.new(52, 11, wheel).gear_inches
puts Gear.new(52, 11).ratio

# The path to changeable and maintainable object-oriented software
# begins with classes that have a single responsibility. Classes that
# do one thing isolate that thing from the rest of your application.
# This isolation allows change without consequence and reuse without
# duplication.
