require 'rails_helper'

RSpec.describe Task, type: :model do
  # subject { 
  #   described_class.new(user_id: 1, 
  #                       task_name: "test1",
  #                       content: "test1, content.",
  #                       start_time: Time.now - 13.hours,
  #                       end_time: Time.now + 75.hours,
  #                       priority: 3,
  #                       status: 5
  #   )
  # }
  # describe "Validations" do
  #   it "is valid with valid attributes" do
  #     expect(subject).to be true
  #   end

  #   it "is not valid without a password" do
  #     subject.task_name = nil
  #     expect(subject).to_not be true
  #   end

  #   it "is not valid without an email" do
  #     subject.content = nil
  #     expect(subject).to_not be true
  #   end
  # end
  describe ".validate_content_with_task_name" do
    it "is invalid without content" do
     task = Task.new( :user_id => 1,
                      :task_name => "test1",
                      :start_time => Time.now - 13.hours,
                      :end_time => Time.now + 75.hours,
                      :priority => 3,
                      :status => 5)
     expect( task ).to_not be_valid
    end

    it "is invalid without task_name" do
     task = Task.new( :user_id => 2,
                      :content => "test2 content",
                      :start_time => Time.now - 9.hours,
                      :end_time => Time.now + 47.hours,
                      :priority => 1,
                      :status => 2)
     expect( task ).to_not be_valid
    end
  end
end

