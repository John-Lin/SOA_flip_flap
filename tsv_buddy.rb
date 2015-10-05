# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    survey = []
    lines = []
    tsv.each_line { |line| lines << line }
    keys = lines[0].split("\t")
    keys.map!(&:chomp)
    lines.shift
    lines.each do |line|
      values = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = values[index].chomp }
      survey.push(record)
    end
    @data = survey
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    line = ''
    keys_array = @data[0].keys
    line << keys_array[0]
    keys_array.shift # maybe there is a better way of implementing this rather than dealing with the first heading value on its own
    keys_array.each { |key| line << "\t" + key }
    line << "\n"
    @data.each do |record|
      line << record.map { |_, v| "#{v}" }.join("\t")
      line << "\n"
    end
    line.chomp("\t")
    line
  end
end
