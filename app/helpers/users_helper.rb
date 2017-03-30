module UsersHelper
    def job_title_icon
        title = @user.profile.job_title
        if title == "Developer"
            "<i class='fa fa-code'></i>".html_safe
        elsif title == "Investor"
            "<i class='fa fa-dollar'></i>".html_safe
        elsif title == "Entrepreneur"
            "<i class='fa fa-bulb'></i>".html_safe
        end
    end
end