package com.epam.rd.izh.config;

import com.epam.rd.izh.converter.CarConverter;
import com.epam.rd.izh.service.UserDetailsServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  private UserDetailsServiceMapper userDetailsService;

  /**
   * configure методы определяют настройку Spring Security.
   */
  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
        /**
         * Список всех энд-пойнтов, требующих особой политики авторизации.
         * /login доступен только неавторизованным пользователям.
         * /registration и входящие в него энд-пойнты доступны всем пользователям.
         * Сюда можно добавить свои энд-пойнты, спецефические для выбранного проекта.
         */
        .authorizeRequests()
        .antMatchers("/login").anonymous()
        .antMatchers("/registration").permitAll()

         /**
         * Открытие доступа к ресурсным пакетам:
         * /webapp/css
         * /webapp/js
         * /webapp/images
         * /webapp/fonts
         */
        .antMatchers("/src/main/webapp/WEB-INF/css/**").permitAll()
        .antMatchers("/js/**").permitAll()
            .antMatchers("/images/**").permitAll()
        .antMatchers("/fonts/**").permitAll()

        /**
         * Любой реквест, кроме перечисленных выше, доступен лишь авторизованному пользователю.
         * Неавторизованный пользователь будет переброшен на "/login".
         */
        .anyRequest().authenticated()

        /**
         * отключение настройки csrf.
         */
        .and()
        .csrf().disable()

        /**
         * Настройка логики страницы логина.
         * Обратить внимание на переход страницы в случае успешной авторизации.
         */
        .formLogin()
        .loginPage("/login")
        .loginProcessingUrl("/login/process")
        .defaultSuccessUrl("/catalog")
        .failureUrl("/login?error")
        .usernameParameter("login")
        .passwordParameter("password")

        /**
         * Включение функции выхода из текущей сессии.
         */
        .and()
        .logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/auth/logout", "POST"))
            .invalidateHttpSession(true)
            .clearAuthentication(true)
            .deleteCookies("JSESSIONID")
            .logoutSuccessUrl("/auth/login");
  }

  @Override
  protected void configure(AuthenticationManagerBuilder authentication) {
    authentication.authenticationProvider(authProvider());
  }

  /**
   * Класс, обеспечивающий механизм авторизации. Принимает в себя реализацию сервиса авторизации UserDetailsService
   * и механизм шифрования пароля (реализацию PasswordEncoder).
   * Итоговый бин DaoAuthenticationProvider добавляется в контекст приложения и обеспечивает основную
   * логику Spring Security.
   */
  @Bean
  public DaoAuthenticationProvider authProvider() {
    DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
    authProvider.setUserDetailsService(userDetailsService);
    authProvider.setPasswordEncoder(passwordEncoder());
    return authProvider;
  }

  /**
   * Механизм шифрования пароля, реализующий интерфейс PasswordEncoder. В данном примере использован
   * BCryptPasswordEncoder, можно написать свою реализацию, создав собственный класс шифрования.
   */
  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public CarConverter carConverter() { return new CarConverter(); }
}
