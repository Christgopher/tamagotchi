class Tamagotchi
  @@all_list = []
  @@food_level = {}
  @@sleep_level = {}
  @@happiness_level = {}
  @@time = {}
  define_method(:initialize) do |name|
    @name = name
    @@food_level.store(name, 10)
    @@happiness_level.store(name, 10)
    @@sleep_level.store(name, 10)
    @@time.store(name, Time.new(2015, 4, 28, 0, 0, 0))
  #  @initialized_time = Time.now()
  end
  define_method(:name) do
    @name
  end
  define_method(:food_level) do |name|
    @@food_level.fetch(name)
  end
  define_method(:happiness_level) do |name|
    @@happiness_level.fetch(name)
  end
  define_method(:sleep_level) do |name|
    @@sleep_level.fetch(name)
  end
  define_method(:time_passes) do |name|
    current_time = Time.new(2015, 4, 28, 0, 5, 0)
    #current_time = Time.now()
    time_difference = current_time.-(@@time.fetch(name)).to_i()
    levels_to_subtract = time_difference./(300)
    food_level = @@food_level.fetch(name)
    new_food_level = food_level.-(levels_to_subtract)
    @@food_level.delete(name)
    @@food_level.store(name, new_food_level)
    sleep_level = @@sleep_level.fetch(name)
    new_sleep_level = sleep_level.-(levels_to_subtract)
    @@sleep_level.delete(name)
    @@sleep_level.store(name, new_food_level)
  end
  define_method(:is_alive) do |name|
    @@food_level.fetch(name).>(0)
  end
  define_method(:set_food_level) do |food, name|
    @@food_level.delete(name)
    @@food_level.store(name, food)
  end
  define_method(:feed) do |name|
    if @@food_level.fetch(name).<(10)
      new_food_level = @@food_level.fetch(name).+(1)
      @@food_level.delete(name)
      @@food_level.store(name, new_food_level)
    end
  end
  define_method(:play) do |name|
    new_happiness_level = @@happiness_level.fetch(name).+(1)
    @@happiness_level.delete(name)
    @@happiness_level.store(name, new_happiness_level)
  end
  define_method(:put_to_sleep) do |name|
    @@sleep_level.delete(name)
    @@sleep_level.store(name, 15)
  end
  define_singleton_method(:all_list) do
    @@all_list
  end
  define_method(:save) do
    @@all_list.push(self)
  end
  define_singleton_method(:clear) do
    @@all_list = []
  end
end
