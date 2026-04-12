require 'minitest/autorun'
load File.expand_path('../bin/agc', __dir__)

class TestAGC < Minitest::Test
  def setup
    # Make sure we run from repo root mentally or handle paths properly in tests
  end

  def test_parse_args_assigns_context_and_for
    agc = AGC.new(['all', 'list', '--for', 'agy', '--local'])
    
    # We can inspect instance variables using instance_variable_get for testing
    opts = agc.instance_variable_get(:@options)
    assert_equal :agy, opts[:for]
    assert_equal :local, opts[:context]
    assert_equal 'all', agc.instance_variable_get(:@entity)
  end
  
  def test_yaml_config_loading_via_build_folders
    # build_folders should fall back successfully out of the box dynamically
    # Since config.sample.yaml exists in the repository, it will pick it up or fallback!
    folders = build_folders
    assert folders.is_a?(Array), "Should return an array of folders"
    assert !folders.empty?, "Folder list should not be empty"
    
    global_ag = folders.find { |f| f[:comment] == 'Global Antigravity settings' }
    refute_nil global_ag, "Expected to find the Global Antigravity settings folder in config"
    assert_equal :global, global_ag[:context]
    assert_includes global_ag[:visibility], :agy
  end
end
