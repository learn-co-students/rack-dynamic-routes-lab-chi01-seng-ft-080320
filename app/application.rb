class Application
    @@items = [Item.new("tea", 3.38), Item.new("coffee", 5.38)]

    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new
        
        if req.path.match(/item/)
            item_name = req.path.split("/items/").last
            if item = @@items.find { |item_instance| item_instance.name == item_name }
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end

        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end # end of #call

end # end of Application class