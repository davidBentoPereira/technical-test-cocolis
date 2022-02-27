require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe WelcomeEmailJob, type: :worker do
  let!(:user) { create(:user) }
  let(:time) { (Time.zone.today + 5.minutes).to_datetime }
  let(:scheduled_job) { described_class.perform_at(time, user.email, user.first_name) }

  subject { described_class.perform_async(user.email, user.first_name) }

  describe 'testing worker' do
    it 'runs the worker' do
      subject
      expect(WelcomeEmailJob).to have_enqueued_sidekiq_job(user.email, user.first_name)
    end

    it 'occurs at expected time' do
      scheduled_job
      assert_equal true, described_class.jobs.last['jid'].include?(scheduled_job)
      expect(described_class).to have_enqueued_sidekiq_job(user.email, user.first_name)
    end
  end
end
