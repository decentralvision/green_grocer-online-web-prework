def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item_hsh|
    count = cart.count(item_hsh)
    item_hsh.each do |item, data|
      binding.pry
      consolidated_cart[item] = data
      consolidated_cart[item][data][:count] = count
    end
    cart.delete(item_hsh)
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
