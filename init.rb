config.middleware.use ::ActionDispatch::Static, "#{root}/public"
middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
