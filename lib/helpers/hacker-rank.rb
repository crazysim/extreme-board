require 'json'

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
    ucsb_team_names.any? { |s| s.casecmp(team['hacker'])==0 }
  }
end
