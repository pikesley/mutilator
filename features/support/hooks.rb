Before '@text' do
  add_headers(
    {
      'Accept' => 'text/plain'
    }
  )
end

Before '@csv' do
  add_headers(
    {
      'Accept' => 'text/csv'
    }
  )
end
