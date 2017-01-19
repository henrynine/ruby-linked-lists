def possible_moves(row, col)
  size = 8
  moves = [[1, 2], [2, 1], [-1, 2], [2, -1], [1, -2], [-2, 1], [-1, -2], [-2, -1]]

  new_locs = Array.new
  moves.each do |d|
    if (0..size).include?(row + d[0]) && (0..size).include?(col + d[1])
      new_locs << [row + d[0], col + d[1]]
    end
  end
  new_locs
end

def knight_moves(start, finish)
  paths = [[[start[0], start[1]]]]
  loop do
    paths_length = paths.length
    0.upto(paths_length) do |path_index|
      path = paths[path_index]
      last_move = path.last
      if last_move[0] == finish[0] && last_move[1] == finish[1]
        return path
      end
      possible_moves(last_move[0], last_move[1]).each do |move|
        paths << (path + [[move[0], move[1]]])
      end
    end
  end
end
