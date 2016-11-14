require_relative '../battleship'

describe 'battleship' do

  describe 'board' do
    #let(:board) { Array.new(22, Array.new(44, "X")) }
    it "is a board of 22 rows" do
      expect(board_size.length).to eq 22
    end

    it "is a board of 22 rows and 44 columns" do
      expect(board_size.join.length).to eq 968
    end



  end
end

