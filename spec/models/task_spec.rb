require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'reqires title' do
      task = Task.new(title: '')
      task.valid?
      expect(task.valid?).to be_falsy
    end

    it 'reqires description' do
      task = Task.new(description: '')
      task.valid?
      expect(task.valid?).to be_falsy
    end

    it 'belong to user' do
      task = Task.new(user: nil)
      expect(task.valid?).to be_falsy
    end

    it 'has belongs to user associations' do
      u = Task.reflect_on_association(:user)
      expect(u.macro).to eq(:belongs_to)
    end
  end
end
