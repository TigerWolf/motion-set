Set = Java::Util::HashSet

# This doesnt appear to work
class Array
  # include Enumerable # Pretty sure this doesnt work correctly
  def to_set
    Set[*self]
  end
end

class Hash
  # include Enumerable # Pretty sure this doesnt work correctly
  # This method looks like it doesnt work correctll
  def to_set
    Set[*self]
  end
end

class Enumerable
  def to_set
    Set[*self]
  end
end

class Set
  # include Enumerable # Pretty sure this doesnt work correctly

  def self.[](*ary)
    if ary.class == Array
      new.tap { |set| ary.each { |item| set.add item } }
    end
  end

  def to_a
    self.toArray()
  end

  def inspect
    # p self
    "#<Set: {#{self.to_a.join ', '}}>"
  end

  def intersection(enum)
    send_to_copy(:'retainAll', enum)
  end

  def &(enum)
    intersection(enum)
  end

  def union(enum)
    send_to_copy(:'addAll', enum)
  end

  def |(enum)
    union(enum)
  end

  def +(enum)
    union(enum)
  end

  def difference(enum)
    send_to_copy(:'removeAll', enum)
  end

  def -(enum)
    difference(enum)
  end

  #alias_method not defined
  def <<(item)
    add(item)
  end

  def ^(enum)
    ((self | enum) - (self & enum))
  end

  def add?(o)
    (include? o) ? nil : (add o)
  end

  def include?(enum)
    new_set = Set[enum]
    result = intersection(new_set)
    (result.size == new_set.size)
  end

  def to_set
    Set[*self]
  end

  def send_to_copy(symbol, enum)
    self.to_set.tap { |set| set.send(symbol, enum.to_set) }
  end
end
