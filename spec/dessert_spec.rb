require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:eclair) {Dessert.new("eclair", 2, "alan")}

  describe "#initialize" do
    it "sets a type" do
      expect(eclair.type).to eq("eclair")
    end


    it "sets a quantity" do
      expect(eclair.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(eclair.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
       expect {Dessert.new("eclair", "noninteger", :chef) }.to raise_error(ArgumentError)
     end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(eclair.add_ingredient("tomato")).to eq(["tomato"])
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      eclair.add_ingredient("tomato")
      eclair.add_ingredient("zucchini")
      eclair.add_ingredient("broccoli")
      eclair.add_ingredient("anchovies")
      initial = eclair.ingredients.dup
      eclair.mix!
      expect(eclair.ingredients).not_to eq(initial)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      eclair.eat(1)
      expect(eclair.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
    expect {eclair.eat(5)}.to raise_error("not enough left!")
  end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(eclair.serve).to include("Alan")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do

      expect(chef).to receive(:bake).with(eclair)
        eclair.make_more
    end
  end
end
