require "uri"
require "net/http"
require "openssl"
require "json"

def top_page()
    "<html>
       <head>
       </head>
       <body>
           <ul>"
end


#esto deberìa devolver el hash con los resultados / Concatenar el APIKEY en la url
def request (addres)
    url = URI(addres) #pasarla a uri
    http = Net::HTTP.new(url.host, url.port) #puerto y host
    request = Net:: HTTP::Get.new(url) #generamos 
    http.use_ssl = true #le direcmos que ocupe ssl
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER #y que lo verifique de ida y de vuelta
    response = http.request(request)    #
    return JSON.parse(response.read_body)   #transformado a JSON
end
["results"]
data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=1&api_key=9ki4TX2sTe4ChgwMpGBlLbhaO1grr4hQ2aXGcMuy")

#prueba .........
# images = ""

# data["photos"].each do |item|
    
#     images += "<li><img src='" + item ["img_src"] + "'></li> "
#     return images
# end
#prueba .........

imagesurl =[]

data["photos"].each do |character|
    avion = character ["img_src"]
    imagesurl.push (avion)
end


def buttons (array)
    buttons = ""
    array.each do |name|
        buttons += url = "<li><img src='#{name}'></li>"
    end

    return buttons
    puts

end

my_buttons = buttons(imagesurl)


# data["photos"].each do |item|
#     urlphoto = item ["camera"]["id"]
#     url = "<li><img src='#{urlphoto}'></li>"
# puts url
# end



def botom_page()
    "       </ul>
        </body>
    </html4>"
end





index = top_page() + my_buttons + botom_page()

File.write("./index.html", index)