#!/usr/bin/env ruby

$LOAD_PATH << './lib'
$LOAD_PATH << './lib/bicycle_lock'
require './lib/bicycle_lock'

DISC_COUNT = 6
from = [9, 1, 2, 3, 4, 5]
to =   [7, 0, 0, 0, 0, 1]
exclude = [[2, 0, 0, 1, 2, 3], [7, 0, 0, 0, 0, 2], [1, 0, 1, 0, 0, 0], [1, 0, 0, 0, 0, 1]]

history_arr = BicycleLock::Generator.(from: from, to: to, exclude: exclude)
pp history_arr
