# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /this is a longer string/
      '/this%20is%20a%20longer%20string'

    when /this is a considerably longer, piece of text/
      '/this%20is%20a%20considerably%20longer,%20piece%20of%20text'

    when /here is a string that is a bit longer/
      'here%20is%20a%20string%20that%20is%20a%20bit%20longer'

    when /a/
      '/a'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
