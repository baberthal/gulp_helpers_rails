require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  before :each do
    GulpHelpers.configure do |config|
      config.stylesheet_path = '/whatever/stylesheets'
    end
  end

  after :each do
    GulpHelpers.configure do |config|
      config.stylesheet_path = '/stylesheets'
    end
  end

  describe 'gulp_stylesheet_link_tag' do
    it 'returns a link tag for the stylesheet specified' do
      expect(helper.gulp_stylesheet_link_tag('application'))
        .to match(%r{/assets/whatever/stylesheets/application})
    end
  end

  describe 'gulp_stylesheet_link_tag' do
    it 'returns a link tag for the javascript file specified' do
      expect(helper.gulp_javascript_include_tag('app'))
        .to match(%r{/assets/javascripts/app})
    end
  end

  describe 'gulp_stylesheet_link_tag' do
    it 'returns an anchor tag for the image specified' do
      expect(helper.gulp_image_tag('smiley'))
        .to match(%r{/assets/images/smiley})
    end
  end
end
