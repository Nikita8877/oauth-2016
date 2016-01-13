Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['VK_KEY'], ENV['VK_SECRET'],
           scope: 'email'

  provider  :facebook,
            ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
            scope: 'public_profile', display: 'page', image_size: 'square'
end
