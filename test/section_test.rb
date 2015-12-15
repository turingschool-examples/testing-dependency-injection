require './test/test_helper'
require './lib/section'

class SectionTest < Minitest::Test
  def test_it_exists
    Section
  end

  def test_it_has_a_name
    sec = Section.new("Biology 1")
    assert_equal "Biology 1", sec.name
  end

  def test_it_has_students
    skip
    sec = Section.new("Biology 1")
    student_1 = Student.new(:first_name => "Frank")
    student_2 = Student.new(:first_name => "Myra")
    sec.enroll(student_1)
    sec.enroll(student_2)
    assert_includes sec.students, student_1
    assert_includes sec.students, student_2
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
