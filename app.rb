require 'sinatra'
require 'csv'

helpers do
  def to_bool(t)
    if !t.nil?
      return t == "on" ? true : false
    end
    false
  end
end

before do
  Beer = Struct.new(:name, :hoppy, :malty, :nitro, :weird, :desc, :abv, :growler, :taster, :tenoz, :pint, :tap1, :tap2)
  @beers = []
  @generations = 12
  @db = CSV.open("beer.csv", "w+")
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
    to_bool(params[:hoppy]), 
    to_bool(params[:malty]), 
    to_bool(params[:nitro]), 
    to_bool(params[:weird]),
    params[:desc],
    params[:abv],
    params[:growler],
    params[:taster],
    params[:tenoz],
    params[:pint],
    params[:tap1],
    params[:tap2]
  )

  begin 
    # define number of generations we want as placeholders, otherwise we go with 12.
    @generations = params[:generations].to_i unless params[:generations].nil? or params[:generations] == ""
  rescue
  end
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

