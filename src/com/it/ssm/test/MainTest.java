package com.it.ssm.test;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.ssm.pojo.User;
import com.it.ssm.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class) //单元测试框架
@ContextConfiguration("classpath:spring-application.xml")
public class MainTest {
    @Autowired
    private UserService userService;

    @Test
    public void testGetUser(){
        System.out.println(userService.getUser(1));
    }
    @Test
    public void testSave(){
       Random rd =  new Random();

       for(int i=0;i<50;i++){
           User u = new User();
           u.setAge(rd.nextInt(100)+1);
           u.setMoney(6666);
           u.setUsername("test"+i);
           userService.saveUser(u);
       }
    }

}
