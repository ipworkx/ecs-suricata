def compact(h)
  h.inject({}) do |result, (k, v)|
    if v.is_a?(Hash)
      result[k] = compact(v)
    elsif v.is_a?(String)
      result[k] = v unless v.empty?
    elsif !v.nil?
      result[k] = v
    end
    result
  end
end

def filter(event)
  return [LogStash::Event.new(compact(event.to_hash_with_metadata))]
end

test "remove keys with nil values" do

  in_event { { "foo" => 1, "bar" => nil, "nested" => { "baz" => nil, "biz" => "yo" }} }

  expect("return a single event") do |events|
    events.size == 1
  end

  expect("kept the foo key") do |events|
    events.first.get("[foo]") == 1
  end

  expect("kept the [nested][biz] key") do |events|
    events.first.get("[nested][biz]") == "yo"
  end

  expect("remove the bar key") do |events|
    !events.first.include?("[bar]")
  end

  expect("remove the baz key") do |events|
    !events.first.include?("[nested][baz]")
  end
end
