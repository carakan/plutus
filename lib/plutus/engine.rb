module Plutus
  class Engine < Rails::Engine
    isolate_namespace Plutus

    config.to_prepare do
      path = Rails.root + 'app/overrides/plutus/**/*_override*.rb'
      Dir.glob(path).each { |c| require_dependency(c) }
    end
  end
end
