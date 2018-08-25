require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        category = Category.new
        expect(category).to be_invalid
      end

      it 'has a unique title' do
        Category.create(title: 'Game Dev')
        category = Category.new(title: 'Game Dev')
        expect(category).to be_invalid
      end

      
    end
  end
end
