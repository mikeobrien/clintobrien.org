require "release/robocopy"

task :default => :deploy

desc "Deploys the application."
robocopy :deploy do |rc|
    rc.source = "src"
    rc.target = "D:/Websites/www.clintobrien.org/wwwroot"
    rc.excludeDirs = "obj GuestBook"
    rc.includeFiles = "*.dll *.pdb *.config *.asax *.ascx *.ashx " \
                      "*.aspx *.master *.htm *.html *.txt *.css " \
                      "*.gif *.jpg *.jpeg *.png *.xml *.js"
    rc.logPath = "Robocopy.log"
end