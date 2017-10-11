FactoryGirl.define do
  factory :user do
    uid "15232421"
    username "jimszalew"
    oauth_token ENV['GITHUB_ACCESS_TOKEN']
  end
end
