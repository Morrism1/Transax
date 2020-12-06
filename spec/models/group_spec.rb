require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'Maurice')
    @icon = 'image.jpg'
  end
  context 'validation' do
    subject do
      described_class.new(
        name: 'Test',
        user_id: @user.id
      )
    end

    it 'Should be valid' do
      @group = Group.new(name: 'Sports',icon: @icon, user_id: @user.id)
      expect(@group.save).to be true
    end

    it 'is valid with requirements' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name present' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid with a non-unique name' do
      Group.create(name: 'A Taken Group Name', user_id: @user.id)
      subject.name = Group.last.name
      expect(subject).not_to be_valid
    end
  end
  context 'Validates group name' do
    it 'should not be valid' do
      @group = Group.new(name: '')
      expect(@group.save).not_to be true
    end
  end
  context 'Group associations tests' do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
  end
end
