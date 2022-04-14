package com.it.ssm.mapper;

import com.it.ssm.pojo.User;

import java.util.List;

public interface UserMapper {
    public User getUserById(int id);

    List<User> getUsers();

    void saveUser(User user);
    public void updateUser(User user);
    public void delete(int id);
}
