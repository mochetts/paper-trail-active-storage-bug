require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_multiple_versions_on_creation
    user = User.create(first_name: "Jane", file: non_empty_pdf.signed_id)
    assert_equal 1, user.versions.count
  end

  private

  def non_empty_pdf
    filepath = "#{Rails.root}/test/fixtures/files/non_empty.pdf"
    file = Rack::Test::UploadedFile.new(filepath)
    ActiveStorage::Blob.create_and_upload!(
      io: file.open,
      filename: file.original_filename,
      content_type: file.content_type
    )
  end
end
