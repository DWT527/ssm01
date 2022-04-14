package com.it.ssm.service;

import com.it.ssm.pojo.User;

import java.util.List;

public interface UserService {
    public User getUser(int id);

    List<User> getUsers();

    void saveUser(User user);
    public void updateUser(User user);
    public void delete(int id);
}
