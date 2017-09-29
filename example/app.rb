require 'sinatra'

get '/' do 
    # serves the top-level page display
    File.read(File.join('public', 'index.html'))
end

get '/words' do
    # queries all words in the collection and returns it as a JSON document to display on the page 
    # content is set to application/json
    content_type :json
end

put '/words' do
    # when the 'Add' button is clicked it will create a new document to send to the database
    # grabs the word and the description from the HTML input boxes
    new_word = {word: params[:word], definition: params[:definition]}
end


