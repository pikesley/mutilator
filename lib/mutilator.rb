require 'sinatra'
require 'rack/conneg'
require 'wordbot'
require 'haml'
require 'kramdown'
require 'gyoku'

class Mutilator < Sinatra::Base
  use(Rack::Conneg) do |conneg|
    conneg.set :accept_all_extensions, false
    conneg.set :fallback, :html
    conneg.provide([:html, :json, :xml, :text])
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
            project: 'mutilator',
            ribbon:  'right_gray_6d6d6d'
          }
        }
      end
    end
  end

  get '/:text' do
    puts response.headers
    respond_to do |wants|
      wants.json do
        {
          source: params[:text],
          mutilated: Wordbot::Bot.mutilate(params[:text])
        }.to_json
      end

      wants.xml do
        x = '<?xml version="1.0" encoding="UTF-8"?>
               <mutilation>'
        x << Gyoku.xml({
          source: params[:text],
          mutilated: Wordbot::Bot.mutilate(params[:text])
        })

        x << '</mutilation>'

        x
      end

      wants.html do
        haml :mutilated, locals: {
          title: params[:text],
          content: Wordbot::Bot.mutilate(params[:text]),
          github: {
            user:    'pikesley',
            project: 'mutilator',
            ribbon:  'right_gray_6d6d6d'
          }
        }
      end

      wants.text do
        Wordbot::Bot.mutilate params[:text]
      end

      wants.other do
        error_406
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
