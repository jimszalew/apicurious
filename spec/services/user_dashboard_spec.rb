require 'rails_helper'

RSpec.describe UserDashboard, type: :service do

  let(:user) { create(:user) }
  let(:user_dash) { UserDashboard.new(user) }

  context 'class methods' do
    context '.initialize' do
      VCR.use_cassette('userdashboard_initialize') do
        it 'exists' do
          expect(user_dash).to be_a UserDashboard
        end
      end
    end
  end

  # context 'instance methods' do
  #   context '#profile_pic' do
  #     VCR.use_cassette('userdashboard/profile_pic') do
  #       it 'returns a url' do
  #         stub_omniauth
  #
  #         allow_any_instance_of(UserDashboard)
  #         .to receive(:profile_pic)
  #         .and_return(user_dash)
  #
  #         expect(user_dash.profile_pic).to eq("https://avatars0.githubusercontent.com/u/15232421?v=4")
  #       end
  #     end
  #   end
  # end
end
