require "ensure"

RSpec.describe Ensure do
  it "issn should always have a - after the first four numbers" do
    issn = Ensure.seperator('94779472')
    expect(issn).to eq('9477-9472')
  end
end
