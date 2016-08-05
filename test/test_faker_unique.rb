require "test/unit"
require "faker"
require_relative "../lib/faker_unique"

class TestFakerUnique < Test::Unit::TestCase
  def test_uniq
    res = 100.times.map do
      Faker::Name.uniq.name
    end
    assert_equal 100, res.uniq.size
  end

  def test_reset!
    100.times.map do
      Faker::Name.uniq.name
    end
    assert_equal 100, Faker::Name.uniq.pool[:name].size

    Faker::Name.uniq.reset!
    assert_equal 0, Faker::Name.uniq.pool[:name].size
  end

  def test_overflow
    assert_raise do
      # pokemon less than 1000.
      1000.times.map do
        Faker::Pokemon.uniq.name
      end
    end
  end
end
