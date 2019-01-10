def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item_hsh|
    count = cart.count(item_hsh)
    consolidated_cart.store 
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
