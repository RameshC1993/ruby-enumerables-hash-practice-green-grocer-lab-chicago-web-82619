def consolidate_cart(cart)
  new_hash = Hash.new
  
  cart.each do |item|
  item_key = item.keys[0]
   if new_hash.key?(item_key)
    count = new_hash[item_key][:count]
    new_hash[item_key][:count] = count + 1


   else
    item_value = item[item_key]
    item_value[:count] = 1
    new_hash[item_key] = item_value
   end

  end
  return new_hash

end  


def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
