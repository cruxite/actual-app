require 'sinatra'

get '/' do
  erb :brew

  #  @kit = IMGKit.new(render_as_string)
  # format.jpg do 
  #  send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
  #end
end

get '/test-brew' do
  @beers = [
    { name: "test" }
  ]
 erb :brew_new
end

post '/pour' do

  @beer = {
    name: params[:name],
    hoppy: params[:hoppy],
    malty: params[:malty],
    nitro: params[:nitro],
    weird: params[:weird],
    desc: params[:desc],
    abv: params[:abv],
    growler: params[:growler],
    taster: params[:taster],
    tenoz: params[:tenoz],
    pint: params[:pint],
    tap1: params[:tap1],
    tap2: params[:tap2]
  }

  erb :brew_new

end

get '/pour' do
  erb :pour
end
