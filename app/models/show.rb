class Show < ActiveRecord::Base
    validate :show_must_exist, :valid_season, :valid_episode, if: :allow_validation
    
    # only do further validations if all fields are not empty
    def allow_validation
        if !name.blank? and !season.blank? and !episode.blank?
            return true
        end
        if errors[:base].blank?
            errors[:base] << "Please complete all fields"
        end
        return false
    end
    
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
                errors.add(:season, "out of bounds. There's only #{@@show.number_of_seasons} 
                #{"season".pluralize(@@show.number_of_seasons)}")
            end
        end
    end
    
    def valid_episode
        if @@res.total_results != 0 and errors.size == 0
            offset = 1
            # skip season 0 (special episodes) if it exists
            if @@show.seasons[0].season_number == 0
                offset = 0
            end
            episode_count = @@show.seasons[season - offset].episode_count
            if episode < 0 or episode > episode_count
                errors.add(:episode, "out of bounds. There's only #{episode_count} 
                #{"episode".pluralize(episode_count)}")
            end
            # set the poster image path since there are no validation errors
            # use the generic poster path if season poster doesnt exist
            if @@show.seasons[season - offset].poster_path.blank?
                self.image = @@show.poster_path
            else
                self.image = @@show.seasons[season - offset].poster_path
            end
        end
    end
end
