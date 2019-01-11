require 'pry'
def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item_hsh|
    count = cart.count(item_hsh)
    item_hsh.each do |item, data|
      consolidated_cart[item] = data
      consolidated_cart[item][:count] = count
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  couponed_cart = {}
  #checks there are coupons
  if coupons.empty? == false
    #cycle through cart items
    cart.each do |item_name, item_hsh|
      item = item_name
      #cycle through coupons
      coupons.each do |coupon|
        #checks if there is a coupon for an item
        if item_name == coupon[:item]
            coupon_count = coupons.count(coupon)
            clearance = cart[item][:clearance]
            item_count = cart[item][:count]
            coupon_min = coupon[:num]
            #subtract couponed items from count if quantity is sufficient
            if item_count - coupon[:num] * coupon_count > 0
              remaining_items = item_count -= coupon_min * coupon_count
            #insufficient quantity test if any coupons can be applied
            elsif item_count / coupon_min >= 1
              #sets remaining_items to remainder and coupon_count to applicable coupons
              remaining_items = item_count % coupon_min
              coupon_count = item_count / coupon_min
            else
              break
            end
            #initiate hashes for couponed items and remaining_items
            couponed_cart[item] = {
              :price => cart[item][:price],
              :clearance => clearance,
              :count => remaining_items
            }
            couponed_cart["#{item} W/COUPON"] = {
              :price => coupon[:cost],
              :clearance => clearance,
              :count => coupon_count
            }
            coupons.delete(coupon)
        #no coupon items are stored in our new hash
        else
          couponed_cart.store(item_name, item_hsh)
        end
      end
    end
    puts couponed_cart
    couponed_cart
  else
    puts cart
    cart
  end
end

def apply_clearance(cart)
  clearance_cart = {}
  cart.each do |item_name, item_hsh|
    if item_hsh[:clearance]
      price = item_hsh[:price]
      updated_price = (price * 0.8)
      item_hsh[:price] = updated_price.round(2)
      clearance_cart.store(item_name, item_hsh)
    else
      clearance_cart.store(item_name, item_hsh)
    end
  end
  clearance_cart
end

def checkout(cart, coupons)
  output = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
  total = 0
  output.each do |item_name, item_hsh|
    puts item_hsh[:price]
    if item_hsh[:count] > 0
      total += item_hsh[:price] * item_hsh[:count]
    end
  end
  if total >= 100
    total *= 0.9
  end
  puts total
  total
end
