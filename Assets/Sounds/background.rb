use_bpm 240

live_loop :bass do
  40.times do
    use_synth :chiplead
    sleep 1
    play choose(scale(:C2, :major_pentatonic)), cutoff: rrand(60, 120)
    sleep 1
  end
  stop
end

live_loop :mid do
  80.times do
    use_synth :chiplead
    play choose(scale(:C4, :major_pentatonic)), cutoff: rrand(60, 120)
    sleep 1
  end
  stop
end

live_loop :lead do
  4.times do
    sleep 4
    16.times do
      use_synth :chiplead
      play choose(scale(:C5, :major_pentatonic)), amp: 0.8
      sleep 0.66
      play choose(scale(:C5, :major_pentatonic)), amp: 0.8
      sleep 0.34
    end
  end
  10.times do
    play :C4, release: 3
    sleep 4
  end
  stop
end
