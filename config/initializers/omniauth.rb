Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Rails.application.secrets.FACEBOOK_KEY, Rails.application.secrets.FACEBOOK_SECRET

    # on authenticating failures or denials, redirect home
    OmniAuth.config.on_failure = -> (env) do
        Rack::Response.new(['302 Moved'], 302, 'Location' => env['omniauth.origin'] || "/").finish
    end
end