class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    paths = req.path.split("/").delete_if{|path| path == ""}

    if paths[0] == "items"
      item = Item.find_by_name(paths[1])
      if item
        resp.status = 200
        resp.write "#{item.price}"
        resp.finish
      else
        resp.status = 400
        resp.write "Item not found"
        resp.finish
      end
    else
      resp.write "Route not found"
      resp.status = 404
      resp.finish
    end


    # .delete_if{|path| path == ""}
    # binding.pry

    # if paths[1] != "items"
    #   resp.write "Route not found"
    #   resp.status = 404
    # # else
    #   # if Item.all.includes?(paths.last)
    #   #   resp.write "#{it}"
    #
    # end


  end




end
