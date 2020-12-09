require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    @user = User.create(name: 'Maurice')
  end
  context 'validation' do
    subject do
      described_class.new(author_id: @user.id, name: 'Walk the dog', amount: 0.5)
    end

    it 'is valid with requirements' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name present' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid without an amount present' do
      subject.amount = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid with a non-positive amount' do
      subject.amount = 0
      expect(subject).not_to be_valid
      subject.amount = -0.5
      expect(subject).not_to be_valid
    end
  end

  context 'Transaction associations tests' do
    it { should belong_to(:author) }
    it { should have_many(:groups) }
  end
end
