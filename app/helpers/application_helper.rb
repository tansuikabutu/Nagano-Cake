module ApplicationHelper

def price_include_tax(price)
	# floor→小数点以下切り捨て
  price = price * 1.10
  "#{price.floor}円"
end

end
