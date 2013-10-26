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
  }
  json_string = File.read('tmp/list.json')
  json = JSON.parse(json_string)
  teams = json['models']
  teams.select{ |team|
    ucsb_team_names.include?(team['hacker'])
  }
end
