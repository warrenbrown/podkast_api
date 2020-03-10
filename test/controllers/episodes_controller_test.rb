require 'test_helper'

class EpisodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get episodes_url, as: :json
    assert_response :success
  end



  test "should show episode" do
    get episode_url(@episode), as: :json
    assert_response :success
  end

  test "should update episode" do
    patch episode_url(@episode), params: { episode: { description: @episode.description, podcast_id: @episode.podcast_id, title: @episode.title } }, as: :json
    assert_response 200
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete episode_url(@episode), as: :json
    end

    assert_response 204
  end
end
