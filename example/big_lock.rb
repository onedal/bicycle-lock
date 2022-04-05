#!/usr/bin/env ruby

$LOAD_PATH << './lib'
$LOAD_PATH << './lib/bicycle_lock'
require './lib/bicycle_lock'

# DISC_COUNT = 6
# from = [9, 1, 2, 3, 4, 5]
# to =   [7, 0, 0, 0, 0, 1]
# exclude = [[2, 0, 0, 1, 2, 3], [7, 0, 0, 0, 0, 2], [1, 0, 1, 0, 0, 0], [1, 0, 0, 0, 0, 1]]

DISC_COUNT = 4
from = [0, 0, 0, 0]
to = [4, 5, 1, 9]
exclude = [[0, 0, 1, 1], [4, 0, 0, 1], [3, 0, 4, 2], [4, 5, 0, 0], [4, 5, 1, 5]]

operation = BicycleLock::Generator.(from: from, to: to, exclude: exclude)
if operation[:errors]
  p 'Попытка решения'
  pp operation[:iterations]
  p 'Решений нет'
else
  pp operation[:iterations]
end
