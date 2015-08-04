require 'robin'

describe 'RoundRobin' do

  describe 'even numbers' do

    it 'can pair up 4 people' do
      robin = RoundRobin.new
      users = [1,2,3,4]
      expect(robin.pair_up(users)).to eq [
                                    [[1,4], [2,3]],
                                    [[1,3], [4,2]],
                                    [[1,2], [3,4]]]
    end

    it 'can pair up 6 people' do
      robin = RoundRobin.new
      users = [1,2,3,4,5,6]
      expect(robin.pair_up(users)).to eq [
                                    [[1,6], [2,5], [3,4]],
                                    [[1,5], [6,4], [2,3]],
                                    [[1,4], [5,3], [6,2]],
                                    [[1,3], [4,2], [5,6]],
                                    [[1,2], [3,6], [4,5]]]
    end

    it 'can pair up 8 people' do
      robin = RoundRobin.new
      users = [1,2,3,4,5,6,7,8]
      expect(robin.pair_up(users)).to eq [
                                     [[1, 8], [2, 7], [3, 6], [4, 5]],
                                     [[1, 7], [8, 6], [2, 5], [3, 4]],
                                     [[1, 6], [7, 5], [8, 4], [2, 3]],
                                     [[1, 5], [6, 4], [7, 3], [8, 2]],
                                     [[1, 4], [5, 3], [6, 2], [7, 8]],
                                     [[1, 3], [4, 2], [5, 8], [6, 7]],
                                     [[1, 2], [3, 8], [4, 7], [5, 6]]]
    end

  end

  describe 'odd numbers' do

    it 'can pair up 5 people' do
      robin = RoundRobin.new
      users = [1,2,3,4,5]
      expect(robin.pair_up(users)).to eq [
                                    [['x',5], [1,4], [2,3]],
                                    [['x',4], [5,3], [1,2]],
                                    [['x',3], [4,2], [5,1]],
                                    [['x',2], [3,1], [4,5]],
                                    [['x',1], [2,5], [3,4]]]
    end
  end

end