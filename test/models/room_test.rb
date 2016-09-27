require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid room' do
    room = Room.new(number: '11',size: 'small' ,location: 'D.H.Hill')
    assert room.valid?
  end

  test 'invalid without number' do
    room = Room.new(size: 'small' ,location: 'D.H.Hill')
    refute room.valid?, 'room is valid without a number'
    assert_not_nil room.errors[:number], 'no validation error for number present'
  end

  test 'invalid without location' do
    room = Room.new(number: '14' ,size: 'small')
    refute room.valid?, 'room is valid without a location'
    assert_not_nil room.errors[:location], 'no validation error for location present'
  end

  test 'invalid without size' do
    room = Room.new(number: '14' ,location: 'D.H.Hill')
    refute room.valid?, 'room is valid without a size'
    assert_not_nil room.errors[:size], 'no validation error for location present'
  end

  test 'duplicate room' do
    room1= Room.new(number: '11',size: 'small' ,location: 'D.H.Hill')
    room2 = Room.new(number: '11',size: 'small' ,location: 'D.H.Hill')

  end

end
