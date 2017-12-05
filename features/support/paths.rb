# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the home page$/
      '/'
    when /^the login page$/
      '/login'
    when /^the signup page$/
      '/users/new'
    when /^the admins create page$/
      '/admins'
    when /^the admin dashboard page$/
      '/adminDashboard'
    when /^the timings new page$/
    '/timings/new'
    when /^the locations new page$/
    '/locations/new'
    when /^the providers new page$/
    '/providers/new'
    when /^the first location page$/
    '/locations/1'
    when /^the schedulepickup page$/
    '/schedulePickup'
    when /^the edit first timing page$/
    '/timings/1/edit'
    
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
