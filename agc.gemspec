# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "agc"
  spec.version       = File.read("VERSION").strip
  spec.authors       = ["Riccardo Carlesso"]
  spec.email         = ["riccardo.carlesso@gmail.com"]
  spec.summary       = "AntiGravity/GeminiCLI tool (AGC)"
  spec.description   = "A unified CLI tool for managing skills, rules, workflows, and policies across Antigravity and Gemini CLI."
  spec.homepage      = "https://github.com/palladius/agc"
  spec.license       = "Apache-2.0"

  spec.files         = Dir["bin/*", "README.md", "USER_MANUAL.md", "CHANGELOG.md", "VERSION", "justfile", "etc/*"]
  spec.bindir        = "bin"
  spec.executables   = ["agc"]
  spec.require_paths = ["."]
  spec.required_ruby_version = ">= 3.0.0"
end
