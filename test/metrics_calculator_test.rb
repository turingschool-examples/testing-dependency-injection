require './test/test_helper'
require './lib/metrics_calculator'
require './lib/section'

class MetricsCalculatorTest < Minitest::Test
  def test_it_exists
    MetricsCalculator
  end

  def test_it_loads_sections
    skip
    calc = MetricsCalculator.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    sec_3 = Section.new("Biology 3")
    calc.add(sec_1)
    calc.add(sec_2)
    calc.add(sec_3)
    assert_equal 3, calc.section_count
  end

  def test_it_finds_a_total_number_of_students
    skip
    calc = MetricsCalculator.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    sec_3 = Section.new("Biology 3")
    calc.add(sec_1)
    calc.add(sec_2)
    calc.add(sec_3)
    # sec 1 should have 22 students
    # sec 2 should have 24 students
    # sec 3 should have 18 students
    assert_equal 64, calc.total_students
  end

  def test_it_lists_all_student_names
    skip
    sec = Section.new("Biology 1")
    student_1 = Student.new(:first_name => "Frank")
    student_2 = Student.new(:first_name => "Myra")
    sec.enroll(student_1)
    sec.enroll(student_2)
    assert_equal ["Frank", "Myra"], sec.student_names
  end
end
