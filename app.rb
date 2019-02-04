require 'sinatra'
require 'csv'

before do
  Beer = Struct.new(:name, :hoppy, :malty, :nitro, :weird, :desc, :abv, :growler, :taster, :tenoz, :pint, :tap1, :tap2)
  @beers = []
  @generations = 12
  #@db = CSV.open("beer.csv", "wb")
end

get '/' do
  erb :brew

  #  @kit = IMGKit.new(render_as_string)
  # format.jpg do 
  #  send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
  #end
end

post '/pour' do

  # create a beer from params
  @beer = Beer.new(
    params[:name], 
    params[:hoppy], 
    params[:malty], 
    params[:nitro], 
    params[:weird],
    params[:desc],
    params[:abv],
    params[:growler],
    params[:taster],
    params[:tenoz],
    params[:pint],
    params[:tap1],
    params[:tap2]
  )

  # define number of generations we want as placeholders, otherwise we go with 12.
  @generations = params[:generations] unless params[:generations].nil?

  # add beer to list
  @beers << @beer

  erb :brew

end

# destroy the csv we're using for data.
post '/clear' do
  
end

get '/pour' do
  erb :pour
end
