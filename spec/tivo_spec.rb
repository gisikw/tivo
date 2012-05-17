require 'spec_helper'
require 'open-uri'

describe 'Tivo' do
  it 'should skip tests requiring web requests' do
    open('http://google.com')
  end

  it 'should allow tivo-escaped blocks' do
    without_tivo do
      open('http://google.com')
    end
  end
end
