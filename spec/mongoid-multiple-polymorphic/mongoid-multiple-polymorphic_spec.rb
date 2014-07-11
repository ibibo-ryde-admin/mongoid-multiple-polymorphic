require "spec_helper"

describe "Multiple polymorphic support" do
  it "should retrieve the right documents" do
    face = Face.create!
    face.left_eye = Eye.create!(:pupil_dilation => 3)
    face.right_eye = Eye.create!(:pupil_dilation => 5)
    left_eye_id = face.left_eye.id
    right_eye_id = face.right_eye.id
    face.save!
    face.reload
    expect(face.left_eye.pupil_dilation).to be(3)
    expect(face.right_eye.pupil_dilation).to be(5)
    expect(face.left_eye.id).to eq(left_eye_id)
    expect(face.right_eye.id).to eq(right_eye_id)
  end
end
