class Show < ActiveRecord::Base
    belongs_to :user
    
    def addExtraInformation
        show = Tmdb::TV.detail(self.show_id)
        if category == 'Bookmark'
            offset = 1
            if show.seasons[0].season_number == 0
                offset = 0
            end
            if show.seasons[self.season - offset].poster_path.blank?
                self.image = show.poster_path
            else
                self.image = show.seasons[self.season - offset].poster_path
            end
        elsif category == 'Watchlist' or category == 'Archive'
            self.image = show.poster_path
        end
    end
end
