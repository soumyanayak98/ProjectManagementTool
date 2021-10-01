require "test_helper"

class TaskMailerTest < ActionMailer::TestCase
  test "task_updated" do
    mail = TaskMailer.task_updated
    assert_equal "Task updated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
