Given('I go to the login page') do
    @obj = Dotz.new()
    @obj.access_login_page()
end

When('I enter my CPF') do
    @obj.enter_document($config["dotz_user_cpf"])
    sleep 5
end

Then('I enter my password') do
    @obj.enter_password($config["dotz_user_pass"],
                        $config["dotz_user_birth"][8,2], 
                        $config["dotz_user_birth"][5,2], 
                        $config["dotz_user_birth"][0,4][2..-1])
    sleep 5
end

Then('I see I am logged in') do
    @obj.check_logged_in()
end
