def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item_hsh|
    count = cart.count(item_hsh)
    item_hsh[1][:count] = count
    consolidated_cart.store(item_hsh[0], item_hsh)
  end
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
