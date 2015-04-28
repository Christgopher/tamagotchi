require('rspec')
require('tamagotchi')


describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.happiness_level()).to(eq(10))
    end
  end
  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
  end
  describe('#is_alive') do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive()).to(eq(true))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0)
      expect(my_pet.is_alive()).to(eq(false))
    end
  end
    describe("#feed") do
      it("increases food level by one") do
        my_pet = Tamagotchi.new("lil dragon")
        my_pet.set_food_level(9)
        expect(my_pet.feed()).to(eq(10))
      end
    end
    describe("#play") do
      it("increases happiness level by one") do
        my_pet = Tamagotchi.new("lil dragon")
        expect(my_pet.play()).to(eq(11))
      end
    end
    describe('#put_to_sleep') do
      it("sets the sleep level to 15") do
        my_pet = Tamagotchi.new("lil dragon")
        expect(my_pet.put_to_sleep()).to(eq(15))
      end
    end
end
