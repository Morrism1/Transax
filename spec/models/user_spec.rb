require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    subject do
      described_class.new(name: 'Maurice')
    end

    it 'is valid with requirements' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name present' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid without a unique name' do
      User.create(name: 'Other Name')
      subject.name = User.last.name
      expect(subject).not_to be_valid
    end
  end
  context 'User associations tests' do
    it { should have_many(:groups) }
    it { should have_many(:transactions) }
  end
end
