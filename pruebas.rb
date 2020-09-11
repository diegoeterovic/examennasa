require "uri"
require "net/http"
require "openssl"
require "json"


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



data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=1&api_key=9ki4TX2sTe4ChgwMpGBlLbhaO1grr4hQ2aXGcMuy")

imagesurl =[]

data["photos"].each do |character|
    avion = character ["id"]
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


index = my_buttons

File.write("./index2.html", index)