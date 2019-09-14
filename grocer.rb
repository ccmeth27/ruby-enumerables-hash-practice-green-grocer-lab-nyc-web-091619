def consolidate_cart(cart)
  cart_hash = {}
  cart.each do |item|
    item.each do |name, price_hash|
      if cart_hash[name].nil?
      cart_hash[name] = price_hash.merge({:count => 1}) 
      else 
      cart_hash[name][:count] += 1
      end
    end 
  end 
  cart_hash
end

def apply_coupons(cart, coupons)
  cart_hash = cart
  coupons.each do |each_coupon|
    coupon_item = each_coupon[:item]
    if cart[coupon_item] && cart[coupon_item][:count] >= each_coupon[:num]
      if cart["#{coupon_item} W/COUPON"]
        cart["#{coupon_item} W/COUPON"][:count] += 1
      else
        cart["#{coupon_item} W/COUPON"] = {:count => 1, :price => each_coupon[:cost]}
        cart["#{coupon_item} W/COUPON"][:clearance] = cart[coupon_item][:clearance]
      end
      cart[coupon_item][:count] -= each_coupon[:num]
    end
  end
  cart_hash
end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  cart = consolidate_cart(items)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart1)
  
  total = 0
  
  cart2.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end
  
  total > 100 ? total * 0.9 : total
end
