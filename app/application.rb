
require 'pry'
class Application

    @@items = [Item.new('phone', 2000), Item.new('car', 1500000)]

    def call(env)
        price = nil
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/items/").last 
            individual_item = @@items.each do |individual_item|
                if individual_item.name == item
                    price = individual_item.price
                end 
            end
            if price != nil 
                resp.write "#{price}"
                resp.status = 200
            else   
                resp.write 'Item not found'
                resp.status = 400
            end 
        else 
            resp.write 'Route not found'  
            resp.status = 404
        end
        resp.finish
    end
end