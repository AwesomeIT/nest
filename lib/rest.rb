# frozen_string_literal: true
require 'active_support'
require 'active_support/core_ext'

module Rest
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :User
  autoload :Sample
  autoload :Experiment
  autoload :Score
end
