# frozen_string_literal: true

# MLB API is down. Monkey-patch it to read from file
module MLB
  class Team
    def self.all
      teams = File.new(Rails.root.join('db/teams.json')).read
      results_to_team JSON.parse(teams)
    end
  end
end
