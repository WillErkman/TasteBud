# frozen_string_literal: true

OpenAI.configure do |config|
	config.access_token = ENV.fetch("OPENAI_API_KEY_RECIPE")
	config.organization_id = ENV.fetch("OPENAI_ORG_ID")
	config.log_errors = true
end