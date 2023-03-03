require './classes/book'

RSpec.describe Book do
    let(:book) { Book.new('Run', 'Simasiku', "2022-03-01", 'Good') }

    describe '#can_be_archived?' do
      context "when cover state is 'Good'" do
        it "returns true if parent method returns is true" do
            allow(book).to receive(:age_in_years).and_return(2)
            expect(book.can_be_archived?).to eq(false) 
        end

        it "returns false if parent method returns false" do
            allow(book).to receive(:age_in_years).and_return(0)
            expect(book.can_be_archived?).to eq(false)
        end
      end

      context "when cover state is 'Bad'" do
        it 'returns true' do
            book.cover_state = 'bad'
            expect(book.can_be_archived?).to eq(true)
        end
      end
    end
end
 