require 'sinatra'
require 'rack/conneg'
require 'wordbot'
require 'haml'
require 'kramdown'
require 'gyoku'

GITHUB = {
  user:    'pikesley',
  project: 'mutilator',
  ribbon:  'right_gray_6d6d6d'
}

class Mutilator < Sinatra::Base
  use(Rack::Conneg) do |conneg|
    conneg.set :accept_all_extensions, false
    conneg.set :fallback, :html
    conneg.provide([:html, :json, :xml, :text, :csv])
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
          github: GITHUB
        }
      end
    end
  end

  get '/:text' do
    respond_to do |wants|
      wants.json do
        get_mutilation(params[:text]).to_json
      end

      wants.csv do
        h = get_mutilation(params[:text])

        s = h.keys.join(',')
        s << "\n"
        s << h.values.join(',')

        s
      end

      wants.xml do
        x = '<?xml version="1.0" encoding="UTF-8"?>
               <mutilation>'
        x << Gyoku.xml(get_mutilation(params[:text]))

        x << '</mutilation>'

        x
      end

      wants.html do
        haml :mutilated, locals: {
          title: params[:text],
          content: Wordbot::Bot.mutilate(params[:text]),
          github: GITHUB
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

  def error_406
    content_type 'text/plain'
    error 406, "Not Acceptable"
  end

  def get_mutilation text
    {
      source: text,
      mutilated: Wordbot::Bot.mutilate(text)
    }
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
