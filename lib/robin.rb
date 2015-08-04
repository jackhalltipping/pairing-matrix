class RoundRobin

  def pair_up users

    if users.length.odd?
      users.unshift('x')
    end

    list_of_pairs = []
    numTimes = users.length - 1

    numTimes.times do
      list_of_pairs << create_day_pairings(users)
      rotate_all_but_first_user_in users
    end

    list_of_pairs
  end


  def create_day_pairings users
    first_arr = users[0..(users.length/2 - 1)]
    second_arr = users[users.length/2..-1].reverse
    first_arr.zip(second_arr)
  end

  def rotate_all_but_first_user_in users
    first_user = users.shift
    users.rotate!(-1)
    users.unshift(first_user)
  end

end