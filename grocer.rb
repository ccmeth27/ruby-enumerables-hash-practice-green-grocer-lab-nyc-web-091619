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
  coupons.each do |each_coupon|
    coupon_item = each_coupon[:item]
    if cart[coupon_item] && cart[coupon_item][:count] >= each_coupon[:num]
      if cart["#{coupon_item} W/COUPON"]
        cart["#{coupon_item} W/COUPON"][:count] += 1
      else
        cart["#{coupon_item} W/COUPON"] = {:count => 1, :price => each_coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[coupon_item][:clearance]
      end
      cart[name][:count] -= each_coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, info|
    if info[:clearance]
      info[:price] = (info[:price] * 0.80)
    end
  end  
  cart.round
end

def checkout(cart, coupons)
  # code here
end
