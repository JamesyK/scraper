require 'pry'
require 'rspec'

def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end

safely_require '../lib/post'
safely_require '../lib/comment'