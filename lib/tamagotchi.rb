class Tamagotchi
  @@all_list = []
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @happiness_level = 10
    @sleep_level = 10
    @initialized_time = Time.new(2015, 4, 28, 0, 0, 0)
  #  @initialized_time = Time.now()
  end
  define_method(:name) do
    @name
  end
  define_method(:food_level) do
    @food_level
  end
  define_method(:happiness_level) do
    @happiness_level
  end
  define_method(:sleep_level) do
    @sleep_level
  end
  define_method(:time_passes) do
    current_time = Time.new(2015, 4, 28, 0, 5, 0)
    #current_time = Time.now()
    time_difference = current_time.-(@initialized_time).to_i()
    levels_to_subtract = time_difference./(300)
    @food_level = @food_level.-(levels_to_subtract)
    @sleep_level = @sleep_level.-(levels_to_subtract)
  end
  define_method(:is_alive) do
    @food_level.>(0)
  end
  define_method(:set_food_level) do |food|
    @food_level = food
  end
  define_method(:feed) do
    if @food_level.<(10)
      @food_level = @food_level.+(1)
    end
  end
  define_method(:play) do
    @happiness_level = @happiness_level.+(1)
  end
  define_method(:put_to_sleep) do
    @sleep_level = 15
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
