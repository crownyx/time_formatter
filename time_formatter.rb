module TimeFormatter
  def format string
    delimiters = string.scan /\W+/
    formatters = string.scan /[a-z]+/i
    units      = { "yy"   => "y",
		   "yyyy" => "Y",
		   "m"    => "-m",
		   "mm"   => "m",
		   "M"    => "b",
		   "MM"   => "B",
		   "d"    => "-d",
		   "dd"   => "d",
		   "D"    => "a",
		   "DD"   => "A",
		   "h"    => "-I",
		   "hh"   => "I",
		   "H"    => "-H",
		   "HH"   => "H",
		   "mi"   => "M",
		   "p"    => "P",
		   "P"    => "p" }
    self.strftime(formatters.map do |f|
      "%#{units[f]}#{delimiters.shift || ""}"
    end.join)
  end
end

Time.send :include, TimeFormatter
