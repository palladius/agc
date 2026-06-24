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
    underscore_gemini = folders.find { |f| f[:comment] == 'Local folder _gemini config' }
    refute_nil underscore_gemini, "Expected to find 'Local folder _gemini config'"
    assert_equal :local, underscore_gemini[:context]

    underscore_agents = folders.find { |f| f[:comment] == 'Local folder _agents config' }
    refute_nil underscore_agents, "Expected to find 'Local folder _agents config'"
    assert_equal :local, underscore_agents[:context]
  end

  def test_build_folders_includes_regular_unprefixed_folders
    folders = build_folders
    gemini = folders.find { |f| f[:comment] == 'Local folder gemini config' }
    refute_nil gemini, "Expected to find 'Local folder gemini config'"
    assert_equal :local, gemini[:context]

    agents = folders.find { |f| f[:comment] == 'Local folder agents config' }
    refute_nil agents, "Expected to find 'Local folder agents config'"
    assert_equal :local, agents[:context]
  end

  def test_parse_args_for_mcp
    agc = AGC.new(['mcp', 'list', '--for', 'agy'])
    opts = agc.instance_variable_get(:@options)
    assert_equal :agy, opts[:for]
    assert_equal 'mcp', agc.instance_variable_get(:@entity)
  end

  def test_parse_args_search_options
    agc_search = AGC.new(['skills', '--search', 'agy'])
    assert_equal 'skills', agc_search.instance_variable_get(:@entity)
    assert_equal 'agy', agc_search.instance_variable_get(:@search_term)

    agc_query = AGC.new(['skills', '--query', 'another'])
    assert_equal 'skills', agc_query.instance_variable_get(:@entity)
    assert_equal 'another', agc_query.instance_variable_get(:@search_term)

    agc_q = AGC.new(['skills', '-q', 'verbatim'])
    assert_equal 'skills', agc_q.instance_variable_get(:@entity)
    assert_equal 'verbatim', agc_q.instance_variable_get(:@search_term)
  end

  def test_match_entity
    agc = AGC.new(['skills'])
    # match_entity? returns true if term matches basename
    assert agc.send(:match_entity?, 'some-python-skill', 'skills', 'python')
    assert agc.send(:match_entity?, 'some-python-skill', 'skills', 'PYTHON')
    assert !agc.send(:match_entity?, 'some-python-skill', 'skills', 'ruby')
    
    # test with mock/nil values or check if description lookup works gracefully
    assert agc.send(:match_entity?, 'nonexistent_path_xyz', 'skills', '')
  end

  def test_acceptance_search_skills_by_description
    # Capture output of searching a keyword only present in a description (e.g., 'Duckie')
    out, _err = capture_io do
      begin
        AGC.new(['skills', '--search', 'Duckie']).run
      rescue SystemExit
      end
    end
    assert_match(/ai-skills-for-agy/, out)
    assert_match(/Duckie/, out)
  end
end
