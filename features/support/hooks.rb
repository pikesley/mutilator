Before '@html' do
  add_headers(
    {
      'Accept' => 'text/html'
    }
  )
end

Before '@text' do
  add_headers(
    {
      'Accept' => 'text/plain'
    }
  )
end
