class Show < ActiveRecord::Base
    belongs_to :user
    
    def addExtraInformation
        show = Tmdb::TV.detail(self.show_id)
        offset = 1
        if show.seasons[0].season_number == 0
            offset = 0
        end
        if show.seasons[self.season - offset].poster_path.blank?
            self.image = show.poster_path
        else
            self.image = show.seasons[self.season - offset].poster_path
        end
    end
    
    def addShowID
        show = Tmdb::Search.tv(self.name)
        self.update(show_id: show.results[0].id)
    end
end
