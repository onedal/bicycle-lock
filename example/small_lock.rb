#!/usr/bin/env ruby

$LOAD_PATH << './lib'
$LOAD_PATH << './lib/bicycle_lock'
require './lib/bicycle_lock'

DISC_COUNT = 3
from = [0, 0, 0]
to = [4, 5, 8]
# решений нет
# exclude = [[0, 0, 1], [1, 0, 0], [3, 0,8], [4, 5, 0], [4, 5, 1], [4, 5, 1], [3,3,3], [3,3,2],[3,2,2], [2,3,2], [2,2,3] ]
exclude = [[0, 0, 1], [1, 0, 0], [3, 0, 8], [4, 5, 0], [4, 5, 1], [4, 5, 1], [3, 3, 3], [3, 3, 2], [3, 2, 2], [2, 3, 2]]

operation = BicycleLock::Generator.(from: from, to: to, exclude: exclude)

if operation[:errors]
  p 'Попытка решения'
  pp operation[:iterations]
  p 'Решений нет'
else
  pp operation[:iterations]
end
