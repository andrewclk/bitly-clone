get '/' do
	# puts "[LOG] Getting /"
	# puts "[LOG] Params: #{params.inspect}"
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	@url = Url.new(long: params[:long_url])
	if @url.save
		@url.click_count = 0
		@url.save
		redirect to '/'
	else 
		@urls = Url.all
		erb :"static/index"
	end
end

post '/:short' do
	a = Url.find_by(short: params[:short_url])
	b = a.click_count
	a.update(click_count: b+1)
	redirect to a.long
end

get '/:short' do
	a = Url.find_by(short: params[:short])
	b = a.click_count
	a.update(click_count: b+1)
	redirect to a.long
end