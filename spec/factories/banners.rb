FactoryGirl.define do
    factory :banner do
      name "Facebook"
      url "http://facebook.com/"
      image {File.open(Dir.glob(File.join(Rails.root, 'public', 'test_fb_image.png')).sample)}
    end
end