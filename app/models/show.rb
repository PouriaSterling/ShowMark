class Show < ActiveRecord::Base
    validate :show_must_exist, :valid_season, :valid_episode
    
    
    def show_must_exist
        @@res = Tmdb::Search.tv(name)
        if @@res.total_results == 0
            errors[:base] << "Show doesn't exist"
        else
            self.name = @@res.results[0].name
        end
    end
    
    def valid_season
        if @@res.total_results != 0
            @@show = Tmdb::TV.detail(@@res.results[0].id)
            # byebug
            if season < 0 or season > @@show.number_of_seasons
                errors.add(:season, "out of bounds. There are only #{@@show.number_of_seasons} 
                #{"season".pluralize(@@show.number_of_seasons)}")
            end
        end
    end
    
    def valid_episode
        if @@res.total_results != 0 and errors.size == 0
            if episode < 0 or episode > @@show.seasons[season].episode_count
                errors.add(:episode, "out of bounds. There are only #{@@show.seasons[season].episode_count} 
                #{"episode".pluralize(@@show.seasons[season].episode_count)}")
            end
        end
    end
end
