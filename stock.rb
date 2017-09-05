def stock_picker prices
  copy = prices.dup
  while true
    lowest = prices.min
    highest = prices.max
    lowestpos = prices.index(lowest)
    highestpos = prices.index(highest)
    if highestpos == 0 # ignore highest price if it's on the first day
      prices.delete_at(0)
      next
    end
    if lowestpos == prices.length - 1 # ignore lowest price if it's on the last day
      prices.delete_at(lowestpos)
      next
    end
    if lowestpos > highestpos # you need to buy before you can sell
      prices.delete_at(lowestpos)
    else # success! find original positions and return them
      lowestpos = copy.index(lowest)
      highestpos = copy.index(highest)
      indexes = [lowestpos, highestpos]
      return indexes
      break
    end
  end
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
