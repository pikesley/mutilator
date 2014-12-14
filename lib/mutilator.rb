require 'sinatra'
require 'rack/conneg'
require 'wordbot'
require 'haml'
require 'kramdown'

class Mutilator < Sinatra::Base

  use(Rack::Conneg) do |conneg|
    conneg.set :accept_all_extensions, false
    conneg.set :fallback, :html
    conneg.provide([:html, :json, :text])
  end

  before do
    if negotiated?
      content_type negotiated_type
    end
  end

  get '/' do
    respond_to do |wants|
      wants.html do
        haml :index, locals: {
          title: 'Mutilator',
          github: {
            user:    'pikesley',
            project: 'mutilator'
          }
        }
      end
    end
  end

  get '/:text' do
    respond_to do |wants|
      wants.json do
        j = {
          source: params[:text],
          mutilated: Wordbot::Bot.mutilate(params[:text])
        }.to_json
      end

      wants.html do
        haml :mutilated, locals: {
          title: params[:text],
          content: Wordbot::Bot.mutilate(params[:text])
        }
      end

      wants.text do
        Wordbot::Bot.mutilate params[:text]
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
