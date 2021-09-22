class Dotz
    include Capybara::DSL
    include RSpec::Matchers
    
    def access_login_page()
        @page = visit("https://login.dotz.com.br")
    end

    def enter_document(docid)
        find("#cpfOrCNPJ").set(docid)
        click_button("Entrar")
    end

    def enter_password(pass, day, month, year)
        elems = find_all('.ng-tns-c35-1 .ng-star-inserted')

        lbl = find(:xpath, '/html/body/app-root/section/div/app-main/app-step-box/div/div[2]/app-second-step/div[2]/div/form/div[2]/label')
        txt = find(:xpath, '/html/body/app-root/section/div/app-main/app-step-box/div/div[2]/app-second-step/div[2]/div/form/div[2]/input')

        pass.chars.to_a.each { |c| elems.each { |e| if e.text.include?c then e.click end } }

        if lbl.text == "Confirme seu MÊS de nascimento:"
            txt.set(month)
        elsif lbl.text == "Confirme seu DIA de nascimento:"
            txt.set(day)
        else
            txt.set(year)
        end
        sleep 2
        click_button("Entrar")
    end

    def check_logged_in()
        expect(page).to have_css ".nome_usuario_logado"
    end
end