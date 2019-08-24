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
  coupons.each do |coupon|

    if grocery.has_key?(coupon[:item])
      g_item = coupon[:item]
      g_count = grocery[g_item][:count]

      if (g_count % coupon[:num]) == 0
        grocery[g_item + " W/COUPON"] = {
          :price => (coupon[:cost] / coupon[:num]).round(2),
          :clearance => grocery[g_item][:clearance],
          :count => g_count
        }

        grocery[g_item][:count] = 0

      elsif grocery[g_item][:count] > coupon[:num]
        extra = g_count % coupon[:num]
        grocery[g_item][:count] = extra
        grocery[g_item + " W/COUPON"] = {
          :price => (coupon[:cost] / coupon[:num]).round(2),
          :clearance => grocery[g_item][:clearance],
          :count => g_count - extra
        }

      end
    end
  end

  return grocery
end

def apply_clearance(grocery)
  grocery.each do |key, value|
    if value[:clearance]
      grocery[key][:price] = (grocery[key][:price] * 0.8).round(2)
    end
  end

  return grocery
end

def checkout(cart, coupons)
  # code here
end
