package com.epam.rd.izh.service;

import com.epam.rd.izh.entity.AuthorizedUser;
import com.epam.rd.izh.entity.User;
import com.epam.rd.izh.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.validation.Valid;

/**
 * Для авторизации через Spring security требуется реализация интерфейса UserDetailsService и его метода
 * .loadUserByUsername(String login).
 */

@Service
public class UserDetailsServiceMapper implements UserDetailsService {


  private final UserRepository userRepository;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Autowired
  public UserDetailsServiceMapper(UserRepository userRepository) {
    this.userRepository = userRepository;
  }


  /**
   * Данный метод должен вернуть объект User, являющийся пользователем текущей сессии.
   * Реализация данного метода включает маппинг, т.е. преобразование бизнес-объекта AuthorizedUser в
   * системный объект Spring приложения User.
   *
   * Рекомендуется внедрить логику, реагирующую на возможные нуллы в методах-геттерах.
   * Пример хорошего кода - логирование или выброс исключения, если наполнение поля объекта критично
   * (например отсутствует роль пользователя).
   */

  @Override
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

    User user = userRepository.findByEmail(email);
    return AuthorizedUser.fromUserDetails(user);
  }

  public boolean saveUser(@Valid User user) {
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    userRepository.save(user);
    return true;
  }

}
