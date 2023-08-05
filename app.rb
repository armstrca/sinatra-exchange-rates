require "sinatra"
require "sinatra/reloader"
require "json"
require 'http'
symbols_url = "https://api.exchangerate.host/symbols"
amounts_url = "https://api.exchangerate.host/latest"
response_amounts = HTTP.get(amounts_url)
response_symbols = HTTP.get(symbols_url)
response_amounts_array = JSON.parse(response_amounts)
@response_symbols_array = JSON.parse(response_symbols)
@levelone = response_amounts_array.fetch("rates")




get("/") do
  @levelone = response_amounts_array.fetch("rates")
  erb(:home)
end




get("/:symbol") do
  @symbol = params[:symbol]
  @levelone = response_amounts_array.fetch("rates")
  @url_symbol = params[:symbol]
  erb(:symbol)
end

get("/:symbol/:symbol2") do
  @symbol = params[:symbol]
  @symbol_two = params[:symbol2]
  @levelone = response_amounts_array.fetch("rates")
  @url_symbol = params[:symbol2]
  erb(:symbol_two)
end
