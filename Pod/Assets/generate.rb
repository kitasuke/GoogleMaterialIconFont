#!/usr/bin/env ruby

codepoints = File.open(File.expand_path('../codepoints.txt', __FILE__), 'r')
outfile = File.expand_path('../../Classes/Font.swift', __FILE__)

names = []
codes = []
codepoints.each_line do |line|
  (name, codepoint) = line.split(/ /)
  if name[0] == '3'
    # enum cases can't start with a numeral
    name = 'three_' + name[1..name.size-1]
  end
  name = name.split('_').collect(&:capitalize).join
  names << "case #{name}"
  codes << "\"\\u{#{codepoint.strip}}\""
end

File.open(outfile, 'w') do |file|
  file.puts <<-SWIFT
//
// THIS FILE IS GENERATED, DO NOT MODIFY BY HAND
//
// Use generate.rb to generate when codepoints.txt is updated
//
// Generated on #{Time.now}
//

@objc public enum MaterialIconFont: Int {
    #{names.join("\n    ")}
}

internal struct IconFont {
    static let codes = [
        #{codes.join(', ')}
    ]
}
SWIFT
end
