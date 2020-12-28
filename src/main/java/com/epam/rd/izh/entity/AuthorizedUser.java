package com.epam.rd.izh.entity;

import com.epam.rd.izh.utils.Role;
import lombok.Data;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Set;

/**
 * Сущность пользователя, содержит данные(credentials), необходимые для авторизации в Spring Web приложении; Может
 * быть использована как часть бизнес логики приложеняи, например сотрудник больницы, где role определяет его
 * полномочия.
 *
 * Рекомендуется добавить поле id в сущнсть пользователя. Поле id может генерироваться базой данных, также можно
 * добавить в код приложения сервис, генерирующий UUID: 'private UUID id = randomUUID();' и проверяющий его на
 * наличие совпадений с уже существующими.
 */
@Data
public class AuthorizedUser implements UserDetails {

  private Long userId;
  private String email;
  private String password;
  private String phone;
  private String billingAddress;
  private Set<SimpleGrantedAuthority> authority;



  /**
   * Определяет GrantedAuthority пользователя. Может быть колелкцией, например Set<Strings> если логика приложения
   * подразумевает множество ролей и их комбинацию в пределах одного пользователя.
   * Хорошим решением будет хранить роль в таблице БД, также допускается использовать ENUM класс в пакете utils.
   * Если роль для бизнес-логики не важна, можно задать для всех объектов 'private String role = "User"'.
   */

  private Role role;

  public Role getRole() {
    return role;
  }

  public String getLogin() {
    return email;
  }

  public void setLogin(String login) {
    this.email = login;
  }

  public String getPassword() {
    return password;
  }

  @Override
  public String getUsername() {
    return email;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Set<SimpleGrantedAuthority> getAuthorities() {
    return authority;
  }

  /**
   * Ниже представлена простая реализация паттерна builder;
   * Паттерн builder рекомендуется использовать в DTO или часто создаваемых Entity объектах для лаконичности кода;
   * Реализация паттерна builder может быть легко добавлена при помощи библиотеки Lombok.
   */

  public AuthorizedUser login(String login) {
    this.setLogin(login);
    return this;
  }

  public AuthorizedUser password(String password) {
    this.setPassword(password);
    return this;
  }


  public void setAuthorities(Set<SimpleGrantedAuthority> role) {
    this.authority = role;
  }

  public static UserDetails fromUserDetails(User user) {
    return new org.springframework.security.core.userdetails.User(
            user.getEmail(),
            user.getPassword(),
            true,
            true,
            true,
            true,
            user.getRole().getAuthorities()
    );
  }

}
