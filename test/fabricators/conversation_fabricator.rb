Fabricator(:conversation) do
  sender {Fabricate(:user)}
  subject 'Test subject'
end