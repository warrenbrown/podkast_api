require 'test_helper'

class PodcastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @podcast = podcasts(:one)
  end
end
