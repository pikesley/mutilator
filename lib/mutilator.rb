require 'sinatra'
require 'rack/conneg'
require 'wordbot'

class Mutilator < Sinatra::Base

  use(Rack::Conneg) do |conneg|
    conneg.set :accept_all_extensions, false
    conneg.set :fallback, :html
    conneg.provide([:html, :json])
  end

  before do
    if negotiated?
      content_type negotiated_type
    end
  end

  get '/:text' do
    respond_to do |wants|
      wants.html do
        Wordbot::Bot.mutilate params[:text]
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end