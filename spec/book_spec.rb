require 'rspec'
require_relative '../classes/books/book'
require_relative '../classes/title'

describe Book do
  book = Book.new('2022-1-1', true, 'Reem', 'Good')

  describe '#new' do
    it 'takes four parameters and returns a Book object' do
      expect(book).to be_a Book
    end
  end

  describe '#publish' do
    it 'returns the correct publisher name' do
      expect(book.publisher).to eq('Reem')
    end
  end

  describe '#cover_state' do
    it 'returns the correct Cover_state' do
      expect(book.cover_state).to eq('Good')
    end
  end

  describe 'Check if the book can be archived'
  it 'Return true if can be archived or cover state is bad otherwise return false' do
    expect(book.can_be_archived?).to eql false
  end
end
