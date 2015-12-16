require './test/test_helper'
require './lib/schedule'

class ScheduleTest < Minitest::Test
  def test_it_exists
    Schedule
  end

  def test_it_has_sections
    skip
    schedule = Schedule.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    schedule.add(sec_1)
    schedule.add(sec_2)
    assert schedule.has_section?("Biology 1")
    assert schedule.has_section?("Biology 2")
    refute schedule.has_section?("Biology 3")
  end

  def test_it_writes_a_schedule_to_the_file_system_by_default
    skip
    `rm schedule.txt`
    refute File.exist?('schedule.txt')

    schedule = Schedule.new
    (1..10).each do |i|
      schedule.add Section.new("History #{i}")
      schedule.add Section.new("Biology #{i}")
      schedule.add Section.new("Algebra #{i}")
    end
    schedule.write

    assert File.exist?('schedule.txt')
  end

  def test_it_writes_a_schedule_by_specifying_the_file_system
    skip
    `rm schedule.txt`
    refute File.exist?('schedule.txt')

    schedule = Schedule.new(File)
    (1..10).each do |i|
      schedule.add Section.new("History #{i}")
      schedule.add Section.new("Biology #{i}")
      schedule.add Section.new("Algebra #{i}")
    end
    schedule.write

    output = File.read("schedule.txt")
    expected = File.read("./test/support/expected.txt")
    assert_equal expected, output
  end

  class FakeFile
    attr_reader :content

    def initialize
      @content = ""
    end

    def write(data)
      @content << data
    end
  end

  def test_it_writes_a_schedule_to_an_injected_writer
    skip

    schedule = Schedule.new(FakeFile)
    (1..10).each do |i|
      schedule.add Section.new("History #{i}")
      schedule.add Section.new("Biology #{i}")
      schedule.add Section.new("Algebra #{i}")
    end
    schedule.write
    target = schedule.output_target

    expected = File.read("./test/support/expected.txt")
    assert_equal expected, target.content
  end
end
