SESSION_EXPIRES_IN = ENV['SESSION_EXPIRES_IN'].present? ? (ENV['SESSION_EXPIRES_IN'].to_i.days) : 1.year