require('rspec')
require('tamagotchi')


describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level("lil dragon")).to(eq(10))
      expect(my_pet.sleep_level("lil dragon")).to(eq(10))
      expect(my_pet.happiness_level("lil dragon")).to(eq(10))
    end
  end
  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes("lil dragon")
      expect(my_pet.food_level("lil dragon")).to(eq(9))
      expect(my_pet.sleep_level("lil dragon")).to(eq(9))
    end
  end
  describe('#is_alive') do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive("lil dragon")).to(eq(true))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0, "lil dragon")
      expect(my_pet.is_alive("lil dragon")).to(eq(false))
    end
  end
    describe("#feed") do
      it("increases food level by one") do
        my_pet = Tamagotchi.new("lil dragon")
        my_pet.set_food_level(9, "lil dragon")
        expect(my_pet.feed("lil dragon")).to(eq(10))
      end
    end
    describe("#play") do
      it("increases happiness level by one") do
        my_pet = Tamagotchi.new("lil dragon")
        expect(my_pet.play("lil dragon")).to(eq(11))
      end
    end
    describe('#put_to_sleep') do
      it("sets the sleep level to 15") do
        my_pet = Tamagotchi.new("lil dragon")
        expect(my_pet.put_to_sleep("lil dragon")).to(eq(15))
      end
    end
    describe('.all') do
      it("lists all the tamagotchis") do
      expect(Tamagotchi.all_list()).to(eq([]))
      end
    end
    describe('#save') do
      it("saves it to the list of all tamagotchis") do
        my_pet = Tamagotchi.new("lil dragon")
        my_pet.save()
      expect(Tamagotchi.all_list()).to(eq([my_pet]))
      end
    end
end
