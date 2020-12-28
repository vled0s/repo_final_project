package com.epam.rd.izh.repository;

import java.util.Optional;

import com.epam.rd.izh.entity.AuthorizedUser;
import com.epam.rd.izh.entity.User;
import org.springframework.data.repository.CrudRepository;

/**
 * Данный репозиторий хранит список зарегистрированных пользователей;
 * На данный момент он представляет из себя коллекцию List<AuthorizedUser> и методы доступа к ней;
 *
 * Необходимо превратить данный репозиторий в DAO класс:
 * Создать базу данных, подключить ее к приложению, сделать CRUD операции (или их часть) для доступа
 * к хранящимся сущностям.
 * Создать другие DAO классы для хранения бизнес-сущностей выбранной темы финального проекта в этом же пакете.
 */


public interface UserRepository extends CrudRepository<User, Long> {

  User findByEmail(String email);

}
