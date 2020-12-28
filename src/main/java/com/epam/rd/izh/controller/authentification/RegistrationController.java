package com.epam.rd.izh.controller.authentification;

import com.epam.rd.izh.entity.AuthorizedUser;
import com.epam.rd.izh.entity.User;
import com.epam.rd.izh.service.UserDetailsServiceMapper;
import com.epam.rd.izh.utils.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    @Autowired
    UserDetailsServiceMapper userDetailsServiceMapper;

    @GetMapping("/registration")
    public String viewRegistration(Model model) {
        if(!model.containsAttribute("registrationForm")){
            model.addAttribute("registrationForm", new AuthorizedUser());
        }
        return "registration";
    }

    /**
     * Метод, отвечающий за подтверждение регистрации пользователя и сохранение данных в репозиторий или DAO.
     */
    @PostMapping("/registration/proceed")
    public String processRegistration(@Valid @ModelAttribute("registrationForm") User registeredUser,
                                      BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        /**
         * Здесь по желанию можно добавить валидацию введенных данных на back-end слое.
         * Для этого необходимо написать реализацию Validator.
         */
        //registeredUser.validate(registeredUserDto, bindingResult);


        if (bindingResult.hasErrors()) {
            //логика отображения ошибки, не является обязательной
            //...
            //...
            return "redirect:/registration";
        }
        /**
         * Здесь происходит присвоение роли пользователю и шифрование пароля.
         * Роль может быть так же определена пользователем на этапе регистрации, либо иным способов, зависящим
         * от темы финального проекта.
         * registeredUser может быть DTO объектом, преобразуемым в AuthorizedUser сущность в сервисе-маппере
         * (эот сервис нужно написать самим), вместе с присвоением роли и шифрованием пароля.
         */
        registeredUser.setRole(Role.USER);

        /**
         * Добавление пользователя в репозиторий или в базу данных через CRUD операции DAO.
         * Рекомендуется вынести эту логику на сервисный слой.
         */
        userDetailsServiceMapper.saveUser(registeredUser);
        /**
         * В случае успешной регистрации редирект можно настроить на другой энд пойнт.
         */
        return "redirect:/login";
    }

}
