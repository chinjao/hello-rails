# -*- coding: utf-8 -*-
require 'net/http'
require 'uri'
require 'json'

class AudioOutputController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def select
    @audio = Audio.new
  end

  def create
    @audio = Audio.new
    @audio.author = params[:audio][:author]
    @audio.script = params[:audio][:script]
    @audio.save

    apikey = '514135756e796d533565725061755971417357664159615373383370674e48676c45624c5537776a795935'

    endpoint = URI.parse('https://api.apigw.smt.docomo.ne.jp/voiceText/v1/textToSpeech')
    endpoint.query = 'APIKEY=' + apikey
    request_body = {
      'text'=>params[:audio][:script],
      'speaker'=>params[:audio][:author]
    }
    print params[:audio][:author]
    res = Net::HTTP.post_form(endpoint, request_body)
    case res
    when Net::HTTPSuccess
      file_name = "docomo.wav"
      File.binwrite(file_name, res.body)
      `aplay docomo.wav` # Linuxならaplayやmpg123を使う
      File.delete(file_name)
    else
      print "error"
      #res.value
    end
    redirect_to '/audio_output/new'
  end
end
