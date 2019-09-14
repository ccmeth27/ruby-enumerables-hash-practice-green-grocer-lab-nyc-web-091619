def consolidate_cart(cart)
  cart_hash = {}
  cart.each do |item|
    item.each do |name, price_hash|
    if cart_hash[item].nil?
      cart_hash[name] = price_hash.merge({:count => 1}) 
    else cart_hash[item_name] = item[item_name]
      cart_hash[item_name][:count] = 1
    end
  end 
  cart_hash
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
