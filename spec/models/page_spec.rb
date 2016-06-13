require 'rails_helper'

RSpec.describe Page, type: :model do
  describe "#save" do
    context "when tries to save with no url" do
      it "does not allow to be saved" do
        page_1 = Page.new(page: 'Page', url: nil, date_time: Date.today)
        page_2 = Page.new(page: 'Page', url: '', date_time: Date.today)

        expect(page_1).to be_invalid
        expect(page_2).to be_invalid
      end
    end

    context "when tries to save with an url" do
      it "allows to be saved" do
        page = Page.new(page: 'Page', url: 'url', date_time: Date.today)

        expect(page).to be_valid
      end
    end

    context "when tries to save with no page" do
      it "does not allow to be saved" do
        page_1 = Page.new(page: nil, url: 'url', date_time: Date.today)
        page_2 = Page.new(page: '', url: 'url', date_time: Date.today)

        expect(page_1).to be_invalid
        expect(page_2).to be_invalid
      end
    end

    context "when tries to save with a page" do
      it "allows to be saved" do
        page = Page.new(page: 'Page', url: 'url', date_time: Date.today)

        expect(page).to be_valid
      end
    end

    context "when tries to save with no dateTime" do
      it "does not allow to be saved" do
        page_1 = Page.new(page: 'Page', url: 'url', date_time: nil)
        page_2 = Page.new(page: 'Page', url: 'url', date_time: '')

        expect(page_1).to be_invalid
        expect(page_2).to be_invalid
      end
    end

    context "when tries to save with a dateTime" do
      it "allows to be saved" do
        page = Page.new(page: 'Page', url: 'url', date_time: Date.today)

        expect(page).to be_valid
      end
    end
  end
end
