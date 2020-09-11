require "uri"
require "net/http"
require "openssl"
require "json"

def top_page()
    puts    "<html>"
    puts    "   <head>"
    puts    "   </head>"
    puts    "   <body>"
    puts    "       <ul>"
end

top_page()
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

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=9ki4TX2sTe4ChgwMpGBlLbhaO1grr4hQ2aXGcMuy")

data["photos"].each do |item|
    print "<li><img src='"
    print item ["img_src"]
    puts "'></li> "
end






def botom_page()
    puts    "       </ul>"
    puts    "   </body>"
    puts    "</html>"
end


botom_page()

export = top_page() + botom_page()

data = File.write("./index.html", export).read




# y esto debe ser exportado a un documento