class Pack
  include Enumerable
  include Comparable
  attr_accessor :animals

  def initialize(animals)
    @animals = animals
  end

  def each
    @animals.each do |animal|
      yield(animal)
    end
  end

  def <=>(other_object)
    # self, other_object = Animal
    self <=> other_object
  end
end

class Animal
  include Comparable
  attr_accessor :name, :weight

  def initialize(name = 'temp name', weight = 0)
    @name = name
    @weight = weight
  end

  def <=>(other_object)
    self.weight <=> other_object.weight
  end
end

pack = Pack.new([Animal.new('1', 15), Animal.new('2', 10)])
#puts pack.max.inspect
pack.map {|animal| animal.name = 'new name'}
puts pack.inspect

#i = [1,2,3].each
# puts i.next
# puts i.next
# puts i.next

#i = ['1','2','3','4']
#puts i.inject(1) {|sum, n| sum + n.to_i } # reduce