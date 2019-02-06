require 'sinatra'
require 'csv'

CSV_FILE = ARGV.size > 0 ? ARGV[0] : "beer.csv"

helpers do
  def to_bool(t)
    if !t.nil?
      return t == "on" ? true : false
    end
    false
  end

  def to_beer (ar)
    b = Beer.new
    b.name =  ar[0]
    b.hoppy = ar[1]
    b.malty = ar[2]
    b.nitro = ar[3]
    b.weird = ar[4]
    b.desc = ar[5]
    b.abv = ar[6]
    b.growler = ar[7]
    b.taster = ar[8]
    b.tenoz = ar[9]
    b.pint = ar[10]
    b.tap1 = ar[11]
    b.tap2 = ar[12]
    b
  end
end

before do
  Beer = Struct.new(:name, :hoppy, :malty, :nitro, :weird, :desc, :abv, :growler, :taster, :tenoz, :pint, :tap1, :tap2)
  @beers = []
  @generations = 12
end

get '/' do

  CSV.foreach(CSV_FILE) do |r|
    @beers << to_beer(r)
  end

  erb :brew

  #  @kit = IMGKit.new(render_as_string)
  # format.jpg do 
  #  send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
  #end
end

post '/pour' do

  hoppy = to_bool(params[:hoppy])
  malty = to_bool(params[:malty])
  nitro = to_bool(params[:nitro])
  weird = to_bool(params[:weird])

  # create a beer from params
  @beer = to_beer (
    [
      params[:name],
      hoppy,
      malty,
      nitro,
      weird,
      params[:desc],
      params[:abv],
      params[:growler],
      params[:taster],
      params[:tenoz],
      params[:pint],
      params[:tap1],
      params[:tap2]
    ]
  )

  begin
    # define number of generations we want as placeholders, otherwise we go with 12.
    @generations = params[:generations].to_i unless params[:generations].nil? or params[:generations] == ""
  rescue
  end
  # add beer to list
  @beers << @beer

  CSV.open(CSV_FILE, "a+") do |t|
    t << @beer
  end

  erb :brew

end

get '/clear' do
  # Nothing really to do but destroy the data within.
  CSV.open(CSV_FILE, "w")
  redirect '/pour'
end

get '/pour' do
  erb :pour
end

