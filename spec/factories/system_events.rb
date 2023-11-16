FactoryBot.define do
  factory :system_event do
    receivedat { FFaker::Time.datetime }
    devicereportedtime { FFaker::Time.datetime }
    facility { (0..16).to_a.sample }
    priority { (1..5).to_a.sample }
    fromhost { FFaker::Internet.ip_v4_address }
    message { FFaker::Lorem.sentence(5) }
    syslogtag { (1..3).to_a.sample.times.map { %w[info warning critical debug error].sample }.join(',') }
  end
end
