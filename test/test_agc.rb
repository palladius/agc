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

  def test_parse_args_for_plugins
    agc = AGC.new(['plugins', 'list', '--for', 'gc'])
    opts = agc.instance_variable_get(:@options)
    assert_equal :gc, opts[:for]
    assert_equal 'plugins', agc.instance_variable_get(:@entity)
  end

  def test_build_folders_includes_config_folder
    folders = build_folders
    config_folder = folders.find { |f| f[:comment] == 'Global Gemini Config' }
    refute_nil config_folder, "Expected to find 'Global Gemini Config' in folders"
    assert_equal :global, config_folder[:context]
    assert_includes config_folder[:visibility], :gc
    assert_includes config_folder[:visibility], :agy
  end

  def test_build_folders_includes_underscore_folders
    folders = build_folders
    underscore_gemini = folders.find { |f| f[:comment] == 'Local repo _gemini config' }
    refute_nil underscore_gemini, "Expected to find 'Local repo _gemini config'"
    assert_equal :local, underscore_gemini[:context]

    underscore_agents = folders.find { |f| f[:comment] == 'Local repo _agents config' }
    refute_nil underscore_agents, "Expected to find 'Local repo _agents config'"
    assert_equal :local, underscore_agents[:context]
  end

  def test_build_folders_includes_regular_unprefixed_folders
    folders = build_folders
    gemini = folders.find { |f| f[:comment] == 'Local repo gemini config' }
    refute_nil gemini, "Expected to find 'Local repo gemini config'"
    assert_equal :local, gemini[:context]

    agents = folders.find { |f| f[:comment] == 'Local repo agents config' }
    refute_nil agents, "Expected to find 'Local repo agents config'"
    assert_equal :local, agents[:context]
  end
end
