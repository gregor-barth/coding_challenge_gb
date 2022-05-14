FactoryBot.define do
  factory :partner do
    name { "Johny Begood" }
    experience { %w[wood carpet tiles] }
    lat { rand(-90.0..90.0) }
    lon { rand(-180.0..180.0) }
    operating_radius { 1000 }
    rating { 3 }
  end
end
