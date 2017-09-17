class User < ActiveRecord::Base
    has_many :shows, dependent: :destroy
    
    def self.create_with_omniauth(auth)
        User.create!(
            :provider => auth["provider"],
            :uid => auth["uid"],
            :name => auth["info"]["name"])
    end
end
