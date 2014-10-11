require 'rubygems'
require 'irb/completion'
require 'mathn'
require 'wirble'

Wirble.init
Wirble.colorize

def gbm(&b)
  before = Time.now.to_f
  res = b.call
  [(Time.now.to_f - before), res]
end
