sample_groups = [
  :bass, :bd, :drum, :elec, :guit, :loop, :mehackit, :misc,
  :perc, :sn, :tabla, :vinyl
]

samples_with_info = sample_groups.flat_map do |group|
  sample_names(group).map do |sample|
    buffer = sample_buffer(sample)
    {
      group: group,
      name: sample,
      duration: buffer.duration,
      num_chans: buffer.num_chans,
      num_frames: buffer.num_frames,
      sample_rate: buffer.sample_rate
    }
  end
end

File.open(ENV["HOME"] + "/Developer/datasette/experiments/03-sonic-pi-samples/main/src/samples.csv", "w") do |file|
  file.puts("group,sample,duration,channels,frames,rate,file")
  samples_with_info.each do |sample_info|
    audio_link = "https://raw.githubusercontent.com/sonic-pi-net/sonic-pi/stable/etc/samples/#{sample_info[:name]}.flac"
    file.puts("#{sample_info[:group]},#{sample_info[:name]},#{sample_info[:duration].round(3)},#{sample_info[:num_chans]},#{sample_info[:num_frames]},#{sample_info[:sample_rate]},#{audio_link}")
  end
end