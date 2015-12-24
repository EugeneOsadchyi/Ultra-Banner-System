FactoryGirl.define do
    factory :banner do
      name "Facebook"
      url "http://facebook.com/"
      max_views_count 10
      image {File.open(Dir.glob(File.join(Rails.root, 'public', 'test_fb_image.png')).sample)}
    end
end