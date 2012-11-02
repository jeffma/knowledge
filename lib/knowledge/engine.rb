module Knowledge
  class Engine < ::Rails::Engine
    isolate_namespace Knowledge
    config.generators do |g|
      g.template_engine :slim
      g.test_framework  :rspec
    end
  end
end
