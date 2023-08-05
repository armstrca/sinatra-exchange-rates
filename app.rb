require "sinatra"
require "sinatra/reloader"
require "json"
require 'http'
amounts_url = "https://api.exchangerate.host/latest"
response_amounts = HTTP.get(amounts_url)
response_amounts_array = JSON.parse(response_amounts)
@levelone = response_amounts_array.fetch("rates")

get("/") do
  @levelone = response_amounts_array.fetch("rates")
  erb(:home)
end

get("/:symbol") do
  @symbol = params[:symbol]
  @levelone = response_amounts_array.fetch("rates")
  erb(:symbol)
end

get("/:symbol/:symbol2") do
  @symbol = params[:symbol]
  @symbol_two = params[:symbol2]
  @levelone = response_amounts_array.fetch("rates")
  erb(:symbol_two)
end
