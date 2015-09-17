require "test_helper"

describe Topic do
  let(:topic) { Topic.new }

  it "must be valid" do
    value(topic).must_be :valid?
  end
end
