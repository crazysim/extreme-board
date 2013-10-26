require 'json'
require 'date'

def get_ucsb_hackers
  ucsb_team_names =%w{
    Handicap
    CodeingAddicts
    TheIncredibleJengas
    MassiveSoulSupport
    seniors
    Arduino
    RubyAndTheGems
    Segfaultless
    DanglingPointers1
    TeamJOBs
    SemiProgrammers
    KMP
    ItOnlyTakesOneToWin
    HKware
    ITTtech
  }

  files = Dir.entries('tmp/aria').select { |entry| File.file? File.join('tmp/aria', entry) and !(entry =='.' || entry == '..') }
  teams = []
  files.map do |file|
    json_string = File.read('tmp/aria/' + file)
    json = JSON.parse(json_string)
    teams_slice = json['models']
    teams += teams_slice
  end

  unsorted_teams = teams.select{ |team|
    ucsb_team_names.include?(team['hacker'])
  }
  sorted_teams = unsorted_teams.sort_by do |team|
    team['score']
  end
  sorted_teams.reverse
end
