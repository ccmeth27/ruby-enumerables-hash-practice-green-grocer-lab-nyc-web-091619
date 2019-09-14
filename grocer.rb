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
  coupons.each do |coupons_hash|
    item = coupons_hash[:item]
    if !cart_hash[item].nil? && cart_hash[item][:count] >= coupons_hash[:num]
      msg = {"#{item} W/COUPON" => {
        :price => coupons_hash[:cost],
        :clearance => cart_hash[item][:clearance],
        :count => 1
        }
      }
      
      if cart_hash["#{item} W/COUPON"].nil?
        cart_hash.merge!(msg)
      else
        cart_hash["#{item} W/COUPON"][:count] += 1
      end
    end
  hash[item][:count] -= coupons_hash[:num]
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
