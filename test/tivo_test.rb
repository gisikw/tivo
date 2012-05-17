require 'test_helper'
require 'open-uri'

class TivoTest < Test::Unit::TestCase

  def test_skip_test_requiring_web_requests
    open('http://google.com')
  end

  def test_allow_tivo_escaped_blocks
    without_tivo do
      open('http://google.com')
    end
  end
end
