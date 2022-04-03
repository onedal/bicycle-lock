#!/usr/bin/env ruby

$LOAD_PATH << './lib'
$LOAD_PATH << './lib/bicycle_lock'
require './lib/bicycle_lock'


DISC_COUNT = 3
from = [0, 0, 0]
to =   [1, 0, 1]
exclude = [[1, 0, 0], [1, 0, 3]]

history_arr = BicycleLock::Generator.call(from: from, to: to, exclude: exclude)
pp history_arr