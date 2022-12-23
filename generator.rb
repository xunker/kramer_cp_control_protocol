#!/usr/bin/env ruby

# Update the JSON command reference with
# `$ ./generator.rb json | json_pp > vp-7xx.json`
#
# Output a markdown version with:
# `$ ./generator.rb markdown > vp-7xx.md`

require 'json'

mode = ARGV[0] || 'json'
modes = %w[json markdown]
unless modes.include?(mode)
  puts "Invalid mode #{mode.inspect}. Available modes are: #{modes.join(', ')}"
  exit 0
end

class VpCommand
  attr_reader :control_type, :function_code, :set_parameters, :description, :group, :response_values, :comments

  CONTROL_TYPES = {
    zero: { set: 0, get: nil },
    set_a: { set: 1, get: 2 },
    set_b: { set: 3, get: 4 },
    five: { set: 5, get: nil },
    set_c: { set: 6, get: 7 },
    eight: { set: nil, get: 8 }
  }

  def initialize(control_type, function_code, set_parameters, description, group = nil, response_values = nil, comments = nil)
    @control_type = control_type
    @function_code = function_code
    @set_parameters = set_parameters
    @description = description
    @group = group
    @response_values = response_values
    @comments = comments
  end

  # group + description
  def full_description(include_response_values: false)
    desc = [group, description].compact.join(': ')
    if include_response_values && response_values&.length.to_i > 0
      desc << '. '
      desc << response_values.map{|k,v| "#{k}: #{v}"}.join(', ')
    end
    desc
  end

  def set_control
    CONTROL_TYPES[control_type][:set]
  end

  def setter?
    !!set_control
  end

  def get_control
    CONTROL_TYPES[control_type][:get]
  end

  def getter?
    !!get_control
  end

  def to_json(_state = nil)
    {
      control_type: CONTROL_TYPES[control_type],
      function_code: function_code,
      set_parameters: set_parameters,
      description: description,
      group: group,
      response_values: response_values,
      comments: comments
    }.to_json
  end

  private

  def parse_response_values(raw_def)
    raw_def
  end
end

# each command arranged as:
# [
#   <control type>,
#   <function code>,
#   <parameters for set>,
#   <description>,
#   <group>
#   <response values>,
#   <comments>
# ]
COMMANDS = [
  [:zero, 0, :none, 'Output', 'Remote Control Button'],
  [:zero, 1, :none, 'Freeze', 'Remote Control Button'],
  [:zero, 2, :none, 'Power', 'Remote Control Button'],
  [:zero, 3, :none, 'AV1', 'Remote Control Button'],
  [:zero, 4, :none, 'AV2', 'Remote Control Button'],
  [:zero, 5, :none, 'Comp', 'Remote Control Button'],
  [:zero, 6, :none, 'YC1', 'Remote Control Button'],
  [:zero, 7, :none, 'YC2', 'Remote Control Button'],
  [:zero, 8, :none, 'VGA1', 'Remote Control Button'],
  [:zero, 9, :none, 'VGA2', 'Remote Control Button', nil, 'VP724 DS/XL Only'],
  [:zero, 10, :none, 'DVI', 'Remote Control Button'],
  [:zero, 11, :none, 'Information', 'Remote Control Button'],
  [:zero, 12, :none, 'Area Left Up', 'Remote Control Button'],
  [:zero, 13, :none, 'Area Middle Up', 'Remote Control Button'],
  [:zero, 14, :none, 'Area Right Up', 'Remote Control Button'],
  [:zero, 15, :none, 'Area Left Center', 'Remote Control Button'],
  [:zero, 16, :none, 'Area Middle Center', 'Remote Control Button'],
  [:zero, 17, :none, 'Area Right Center', 'Remote Control Button'],
  [:zero, 18, :none, 'Area Left Down', 'Remote Control Button'],
  [:zero, 19, :none, 'Area Middle Down', 'Remote Control Button'],
  [:zero, 20, :none, 'Area Right Dow', 'Remote Control Button'],
  [:zero, 21, :none, 'Auto Image', 'Remote Control Button'],
  [:zero, 22, :none, 'Menu', 'Remote Control Button'],
  [:zero, 23, :none, 'Up', 'Remote Control Button'],
  [:zero, 24, :none, 'Left', 'Remote Control Button'],
  [:zero, 25, :none, 'Enter', 'Remote Control Button'],
  [:zero, 26, :none, 'Right', 'Remote Control Button'],
  [:zero, 27, :none, 'Down', 'Remote Control Button'],
  [:zero, 28, :none, 'Auto Gain', 'Remote Control Button'],
  [:zero, 29, :none, 'PIP', 'Remote Control Button'],
  [:zero, 30, :none, 'Swap', 'Remote Control Button'],
  [:zero, 31, :none, 'Contrast', 'Remote Control Button'],
  [:zero, 32, :none, 'Brightness', 'Remote Control Button'],
  [:zero, 33, :none, 'Zoom In', 'Remote Control Button'],
  [:zero, 34, :none, 'Zoom Out', 'Remote Control Button'],
  [:zero, 35, :none, 'Volume Down', 'Remote Control Button'],
  [:zero, 36, :none, 'Mute', 'Remote Control Button'],
  [:zero, 37, :none, 'Volume Up', 'Remote Control Button'],
  [:zero, 38, :none, 'Color Mode', 'Remote Control Button'],
  [:zero, 39, :none, 'Aspect Ratio', 'Remote Control Button'],

  [:set_a, 0, [:integer, -10, 10], 'User1 Gamma', 'Gamma and Color'],
  [:set_a, 1, [:integer, 0, 127], 'User1 Color Temp Red', 'Gamma and Color'],
  [:set_a, 2, [:integer, 0, 127], 'User1 Color Temp Green', 'Gamma and Color'],
  [:set_a, 3, [:integer, 0, 127], 'User1 Color Temp Blue', 'Gamma and Color'],
  [:set_a, 4, [:integer, 0, 32], 'User1 Color Manager Red', 'Gamma and Color'],
  [:set_a, 5, [:integer, 0, 32], 'User1 Color Manager Green', 'Gamma and Color'],
  [:set_a, 6, [:integer, 0, 32], 'User1 Color Manager Blue', 'Gamma and Color'],
  [:set_a, 7, [:integer, 0, 32], 'User1 Color Manager Yellow', 'Gamma and Color'],
  [:set_a, 8, [:integer, -10, 10], 'User2 Gamma', 'Gamma and Color'],
  [:set_a, 9, [:integer, 0, 127], 'User2 Color Temp Red', 'Gamma and Color'],
  [:set_a, 10, [:integer, 0, 127], 'User2 Color Temp Green', 'Gamma and Color'],
  [:set_a, 11, [:integer, 0, 127], 'User2 Color Temp Blue', 'Gamma and Color'],
  [:set_a, 12, [:integer, 0, 32], 'User2 Color Manager Red', 'Gamma and Color'],
  [:set_a, 13, [:integer, 0, 32], 'User2 Color Manager Green', 'Gamma and Color'],
  [:set_a, 14, [:integer, 0, 32], 'User2 Color Manager Blue', 'Gamma and Color'],
  [:set_a, 15, [:integer, 0, 32], 'User2 Color Manager Yellow', 'Gamma and Color'],
  [:set_a, 16, [:integer, 0, 127], 'Brightness'],
  [:set_a, 17, [:integer, 0, 127], 'Contrast'],
  [:set_a, 18, [:integer, -32, 32], 'User Define H-Zoom', 'Aspect Ratio'],
  [:set_a, 19, [:integer, -32, 32], 'User Define V-Zoom', 'Aspect Ratio'],
  [:set_a, 20, [:integer, -32, 32], 'User Define H-Pan', 'Aspect Ratio'],
  [:set_a, 21, [:integer, -32, 32], 'User Define V-Pan', 'Aspect Ratio'],
  [:set_a, 22, [:integer, 0, 255], 'H-Position', 'Graphics Setting'],
  [:set_a, 23, [:integer, 0, 255], 'V-Position', 'Graphics Setting'],
  [:set_a, 24, [:integer, 0, 127], 'Color', 'Graphics Setting'],
  [:set_a, 25, [:integer, 0, 127], 'Hue', 'Graphics Setting'],
  [:set_a, 26, [:integer, 0, 16], 'Sharpness', 'Graphics Setting'],
  [:set_a, 27, [:integer, 0, 100], 'Frequency', 'Graphics Setting'],
  [:set_a, 28, [:integer, 0, 31], 'Phase', 'Graphics Setting'],
  [:set_a, 29, [:integer, 0, 127], 'Color', 'Video Setting'],
  [:set_a, 30, [:integer, 0, 127], 'Hue', 'Video Setting'],
  [:set_a, 31, [:integer, 0, 16], 'Sharpness', 'Video Setting'],
  [:set_a, 32, [:integer, 0, 20], 'H-Position', 'Video Setting'],
  [:set_a, 33, [:integer, 0, 20], 'Video V-Position for NTSC/NTSC 4.43/PAL-M/PAL 60', nil, nil, 'Same function code as for PAL V-Position'],
  [:set_a, 33, [:integer, 0, 39], 'Video V-Position for PAL/PAL-N/SECAM/NTSC 4.43 50', nil, nil, 'Same function code as for NTSC V-Position'],
  [:set_a, 34, [:integer, 0, 32], 'Volume', 'Audio Setting'],
  [:set_a, 35, [:integer, 0, 12], 'Treble', 'Audio Setting'],
  [:set_a, 36, [:integer, 0, 12], 'Bass', 'Audio Setting'],
  [:set_a, 37, [:integer, 0, 36], 'H-Position', 'PIP Setting'],
  [:set_a, 38, [:integer, 0, 36], 'V-Position', 'PIP Setting'],
  [:set_a, 39, [:integer, 0, 255], 'User Define V-Size', 'PIP Setting'],
  [:set_a, 40, [:integer, 0, 255], 'User Define H-Size', 'PIP Setting'],
  [:set_a, 41, [:integer, 0, 36], 'H-Position', 'OSD Setting'],
  [:set_a, 42, [:integer, 0, 36], 'V-Position', 'OSD Setting'],
  [:set_a, 43, [:integer, 3, 60], 'OSD Time Out', 'OSD Setting'],
  [:set_a, 44, [:gt, 100], 'HT, H-Sync Cycle', nil, nil, 'Setting Command should be a reasonable value)'],
  [:set_a, 45, [:gt, 0], 'HW, H-Sync Width', nil, nil, 'Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 46, [:gt, 0], 'HS, Active Pixel Start', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 47, :any, 'HA, Active Pixel', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 48, [:integer, 0, 1], 'HP, H-Sync Polarity (0 for positive polarity, 1 for negative polarity)', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 49, [:gt, 0], 'VT, V-Sync Cycle', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 50, [:gt, 0], 'VW, V-Sync Width', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 51, [:gt, 0], 'VS, Active Line Start', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 52, :any, 'VA, Active Line', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 53, [:integer, 0, 1], 'VA, Active Line (0 for positive polarity, 1 for negative polarity', nil, nil, '1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )'],
  [:set_a, 54, [:gt, 100], 'OCLK', nil, nil, '1. Oclk = Param / 10 Mhz 2. Should be a reasonable value'],
  [:set_b, 0, [:integer, 0, 9], 'Select Input Source', nil, {
    0 => 'VGA-1',
    1 => 'VGA-2',
    2 => 'DVI',
    3 => 'Component',
    4 => 'YC-1',
    5 => 'AV-1',
    6 => 'YV-2',
    7 => 'AV-2',
    8 => 'Scart',
    9 => 'TV'
  }, 'VGA-2 is VP-724 Only'],
  [:set_b, 1, [:integer, 0, 5], 'Video Aspect Ratio', 'Geometry', { 0 => 'Normal', 1 => 'Wide Screen', 2 => 'Pan & Scan', 3 => '4:3', 4 => '16:9', 5 => 'UserDefine' } ],
  [:set_b, 2, [:integer, 0, 3], 'Video Nonlinear', 'Geometry', { 0 => 'Off', 1 => 'Side', 2 => 'Middle' }],
  [:set_b, 3, [:integer, 0, 5], 'VGA Aspect Ratio', 'Geometry', { 0 => 'Full Screen', 4 => '16:9', 1 => 'Native', 2 => 'NonLinear', 3 => '4:3', 5 => 'UserDefine' }],
  [:set_b, 4, [:integer, 0, 10], 'Zoom Ratio', 'Zoom', {
    0 => '100%',
    1 => '150%',
    2 => '200%',
    3 => '225%',
    4 => '250%',
    5 => '275%',
    6 => '300%',
    7 => '325%',
    8 => '350%',
    9 => '375%',
    10 => '400%',
    11 => 'Custom'
  }],
  [:set_b, 5, [:integer, 0, 2], 'Color Format', 'Graphics Setting', { 0 => 'Default', 1 => 'RGB', 2 => 'YUV' }],
  [:set_b, 6, [:integer, 0, 2], 'Color Format', 'Video Setting', { 0 => 'Default', 1 => 'RGB', 2 => 'YUV' }],

  [:set_b, 7, [:integer, 0, 6], 'Video Standard', 'Video Setting', {
    0 => 'Auto',
    1 => 'NTSC',
    2 => 'NTSC 4.43',
    3 => 'PAL',
    4 => 'PAL-N',
    5 => 'PAL-M',
    6 => 'SECAM'
  }],
  [:set_b, 8, [:integer, 0, 1], 'Film Mode', 'Video Setting', {0 => 'Off', 1 => 'On'}],
  [:set_b, 9, [:integer, 0, 1], 'Stereo', 'Audio Setting', {0 => 'Off', 1 => 'On'}],
  [:set_b, 10, [:integer, 0, 1], 'PIP On/Off', 'PIP Setting', {0 => 'Off', 1 => 'On'}],
  [:set_b, 11, [:integer, 0, 9], 'PIP Source', 'PIP Setting', {0 => 'VGA-1', 1 => 'VGA-2(VP-724 Only)', 3 => 'Component', 5 => 'AV-1', 7 => 'AV-2', 2 => 'DVI', 4 => 'YC-1', 6 => 'YV-2', 9 => 'TV', 8 => 'SCART'}, 'VGA-2 is VP-724 Only'],
  [:set_b, 12, [:integer, 0, 5], 'PIP Size', 'PIP Setting', { 1 => '1/16', 3 => '1/4', 0 => '1/25', 2 => '1/9', 5 => 'User Define', 4 => 'Split' }],
  [:set_b, 13, [:integer, 0, 5], 'PIP Frame', 'PIP Setting', {0 => 'Off', 1 => 'On'}],

  [:set_b, 14, [:integer, 0, 2], 'Mode', 'Seamless Switch', { 0 => 'Fast', 1 => 'Moderate', 2 => 'Safe' }],
  [:set_b, 15, [:integer, 0, 2], 'Background' , 'Seamless Switch', {0=> 'Black', 1 => 'Blue', 2 => 'Disable Analog Syncs'}],
  [:set_b, 16, [:integer, 0, 2], 'Auto Search', 'Seamless Switch', {0 => 'Off', 1 => 'On'}],
  [:set_b, 17, [:integer, 0, 1], 'Startup Logo', 'OSD Setting', {0 => 'Off', 1 => 'On'}],
  [:set_b, 18, [:integer, 0, 1], 'Size', 'OSD Setting', { 0 => 'Normal', 1 => 'Double' }],
  [:set_b, 19, [:integer, 0, 1], 'Source Prompt', 'OSD Setting', {0 => 'Off', 1 => 'On'}],
  [:set_b, 20, [:integer, 0, 1], 'Blank Color', 'OSD Setting', { 0 => 'Blue', 1 => 'Black' }],
  [:set_b, 21, [:integer, 0, 17], 'Output Resolution', nil, {
    0 => '640x480',
    1 => '800x600',
    2 => '1024x768',
    3 => '1280x1024',
    4 => '1600x1200',
    5 => '852x1024i',
    6 => '1024x1024i',
    7 => '1366x768',
    8 => '1365x1024',
    9 => '1280x720',
    10 => '720x483',
    11 => '852x480',
    12 => '1400x1050',
    13 => '480P',
    14 => '720P',
    15 => '1080i',
    16 => '576P',
    17 => '1080P',
    18 => '1280x768',
    19 => 'UserDefine'
  }, 'HDTV output is VP723/724 Only 1080P only on KI238 and 80P DAC Board'],
  [:set_b, 22, [:integer, 0, 3], 'Output Refresh Rate', nil, { 0 => '60Hz', 1 => '75Hz', 2 => '85Hz', 3 => '50Hz' }],
  [:set_b, 23, [:integer, 0, 1], 'Factory Reset', nil, { 0 => 'Cancel', 1 => 'ok' }],
  [:set_b, 24, [:integer, 0, 3], 'Input Button', 'Advanced', {0 => 'Freeze/Blank', 1 => 'Freeze', 2 => 'Blank', 3 => 'Ignore'}],
  [:set_b, 25, [:integer, 0, 1], 'Key Lock Save', nil],
  [:set_b, 26, [:integer, 0, 1], 'Input Lock', nil],
  [:set_b, 27, [:integer, 0, 1], 'SOG Setting', nil, { 0 => 'Auto', 1 => 'RGsB', 2 => 'DTV' }, 'KI239 Only'],
  [:set_b, 28, [:integer, 0, 1], 'Enable OSD Timeout', nil,  { 0 => 'Disable', 1 => 'Enable' }],
  [:set_b, 29, [:integer, 0, 2], 'Select Output Mode Userdefined Parameter Group', nil, { 0 => 'Group 1', 1 => 'Group 2', 2 => 'Group 3' }],
  [:set_b, 30, [:integer, 0, 2], 'Set the control way of Saving Audio Volume / Treble / Bass values', nil, { 1 => 'Individual', 0 => 'Master', 2 => 'Linked' }],

  [:five, 0, :none, 'Normal', 'Load Gamma/Color'],
  [:five, 1, :none, 'Presentation', 'Load Gamma/Color'],
  [:five, 2, :none, 'Cinema', 'Load Gamma/Color'],
  [:five, 3, :none, 'Nature', 'Load Gamma/Color'],
  [:five, 4, :none, 'User1', 'Load Gamma/Color'],
  [:five, 5, :none, 'User2', 'Load Gamma/Color'],

  [:set_c, 0, [:integer, 0, 1], 'Power', nil, {0 => 'Power Down', 1 => 'Power On'}],
  [:set_c, 1, [:integer, 0, 1], 'Freeze', nil, {0 => 'Off', 1 => 'On'}],
  [:set_c, 2, [:integer, 0, 1], 'Blank', nil, {0 => 'Off', 1 => 'On'}],
  [:set_c, 3, [:integer, 0, 1], 'Mute', nil, {0 => 'Off', 1 => 'On'}],
  [:set_c, 4, [:integer, 0, 1], 'Key Lock', nil, {0 => 'Off', 1 => 'On'}],

  [:eight, 0, :none, '"Resolution/Refresh Rate" Or "Video Stand". Example: "Y 8 0 CR" return: "Z 8 0 1080i CR"', nil],
].map{|command_def| VpCommand.new(*command_def)}

if mode == 'markdown'
  # Markdown generation BY HAND PEOPLE!  HOW UGLY CAN I BE!?!?!
  puts [
    '# VP-719 Command Reference',
    'As a sanity check against [the original](https://cdn.kramerav.com/web/downloads/protocols/vp-719xl_720xl_vp-724xl_protocol.pdf)',
    'More details at https://github.com/xunker/kramer_cp_control_protocol/'
  ].join("\n\n")

  puts "\n---\n\n"

  field_names = ["Control Type", "Function", "Parameter (for Set)", "Function Group", "Function Description", "Response Values", "Comment"]

  rows = []

  COMMANDS.map{|cmd|

    control_type_f = if (single_control = [cmd.set_control, cmd.get_control].join).length < 2
      single_control
    else
      "#{cmd.set_control}: Set, #{cmd.get_control}: Get"
    end

    set_parameters = if cmd.set_parameters == :none
      'N/A'
    elsif cmd.set_parameters == :any
      '-'
    elsif cmd.set_parameters[0] == :integer
      cmd.set_parameters[1..2].join('~')
    elsif cmd.set_parameters[0] == :gt  
      "> #{cmd.set_parameters[1]}"
    else
      "UNKNOWN! FIX ME"
    end

    response_values = if cmd.response_values&.length.to_i > 0
      cmd.response_values.map{|k,v| "`#{k}`: #{v}"}.join(', ')
    end

    rows << [control_type_f, cmd.function_code, set_parameters, cmd.group, cmd.description, response_values, cmd.comments]
  }

  # calc the max fields widths so we can make the RAW markdown table line up! Awesomely unimportant!
  field_widths = field_names.each_with_index.map{|field, idx|
    ([field_names] + rows).map{|r| r[idx].to_s.length}.max
  }

  # enforce max width
  field_widths = field_widths.map{|w| w > 25 ? 25 : w}

  # print the column headers
  puts field_widths.each_with_index.map{|w, idx|
    field_names[idx].ljust(w, ' ')
  }.join(' | ')
  
  # print beginning bar
  puts field_widths.map{|w| '-' * (w+2)}.join('|')[1..-1]

  rows.each do |row|
    column_deficit = 0
    puts field_widths.each_with_index.map { |max_len, idx|
      if row[idx].to_s.length > max_len
        column_deficit += row[idx].to_s.length - max_len
      end
      # puts "column_deficit (#{row[idx].to_s}): #{column_deficit}" if column_deficit > 0
      
      adj_len = if (column_deficit > 0)
        max_len - column_deficit
      else
        max_len
      end
      # puts "adj_len (#{row[idx].to_s}): #{adj_len}" if adj_len != max_len
      row[idx].to_s.ljust(adj_len, ' ')
    }.join(' | ')
  end
  
else
  # assume json
  puts COMMANDS.to_json
end