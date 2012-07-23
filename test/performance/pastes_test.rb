require 'test_helper'
require 'rails/performance_test_help'

class PastesTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_index
    get '/'
  end

  #def test_show
  #  get '/pastes/4f1de69fee56f416f000000f'
  #end
end
