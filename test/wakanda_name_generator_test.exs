defmodule WakandaNameGeneratorTest do
  use ExUnit.Case
  doctest WakandaNameGenerator

  test "greets the world" do
    assert WakandaNameGenerator.hello() == :world
  end
end
