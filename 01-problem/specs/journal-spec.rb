require "journal"

RSpec.describe Journal do
  it "can be built from a string" do
    journal = Journal.new('Stroman-Erdman,3119-7753')

    expect(journal.name).to eq('Stroman-Erdman')
    expect(journal.issn).to eq('3119-7753')
  end

  it "issn should always have a - after the first four numbers" do
    journal = Journal.new('Raynor-Prosacco,94779472')
    expect(journal.issn).to eq('9477-9472')
  end
end
