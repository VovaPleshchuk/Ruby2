require "test_helper"

class MovieTest < ActiveSupport::TestCase
    test 'should check if movie exists in DB' do
        assert_equal Movie.exists?(), true
      end
    
      test 'should create movie' do
        movie = Movie.new()
        assert movie.save!
      end
end