class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path=="/items/"
        if @item 
            resp.write "#{item.price}"      
        elsif
           !@item
            resp.write "Item not found"
            resp.status = 400
        else
            resp.write "Route not found"
            resp.status = 404
        end
    end 
      end
   
      resp.finish
    end
  end