require 'spec_helper'

describe ApplicationHelper do

  describe "#datepicker_locale" do
    it "returns only 'fr' as fallback" do
      [[:'fr-FR', 'fr'], [:fr, 'fr'], [:'es-ES', 'fr'], [:en, 'fr'], [:foo, 'fr']].each do |locale, datepicker_locale|
        I18n.stub(:locale).and_return(locale)
        helper.datepicker_locale.should eql(datepicker_locale)
      end
    end
  end
end