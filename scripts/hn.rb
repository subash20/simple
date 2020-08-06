#!/usr/bin/ruby -w

require 'nokogiri'
require 'open-uri'
require 'json'

class HNParseError < RuntimeError; end

$stdout.sync = true

url = "https://news.ycombinator.com"

parsed = Nokogiri::HTML(open(url))

titles = parsed.css("td.title > a:first")
subtexts = parsed.css("td.subtext")

if titles.length != 31 or subtexts.length != 30
  raise HNParseError
end

titles = titles[0..29]
capture_time = Time.now.to_i

titles = titles.each_with_index.map { |title, ii|
  { "time" => capture_time,
    "rank" => ii + 1,
    "title" => title.text
  }
}

subtexts = subtexts.map { |subtext|
  subtext_text = subtext.text
  hiring_notice = false
  begin
    unique_id = subtext.css("a:last").attr('href')
  rescue
    unique_id = ""
    hiring_notice = true
  end
  match = /(?<points>\d+) points? by (?<user_name>[^ ]+) (?<duration>[^|]+)[^\d]*(?<num_comments>\d+) comments?/.match(subtext_text)
  match = /(?<points>\d+) points? by (?<user_name>[^ ]+) (?<duration>[^|]+)/.match(subtext_text) if not match
  if match
    points = match["points"]
    user_name = match["user_name"]
    duration = match["duration"]
    begin
      num_comments = match["num_comments"]
    rescue
      num_comments = 0
    end
  else
    points = user_name = duration = num_comments = ""
  end
  { "points" => points.to_i,
    "user_name" => user_name,
    "duration" => duration,
    "num_comments" => num_comments.to_i,
    "unique_id" => unique_id,
    "hiring_notice" => hiring_notice
  }
}

for ii in 0..29
  puts (titles[ii].merge subtexts[ii]).to_json
end
