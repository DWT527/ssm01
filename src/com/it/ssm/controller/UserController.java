package com.it.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.ssm.pojo.User;
import com.it.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("toUser")
    public String toUser(int id, Model model){
       User u =  userService.getUser(id);
        model.addAttribute("user",u);
        return "update";
    }

    @RequestMapping("getUsers")
    public String getUsers(Model model,@RequestParam(value = "pageNum",
            defaultValue = "1") Integer pageNum,@RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize){

        PageHelper.startPage(pageNum,pageSize);
        List<User> users = userService.getUsers();
        PageInfo<User> pageInfo =  new PageInfo<User>(users,10);
        //pageInfo.getNavigatepageNums()
        model.addAttribute("pg",pageInfo);
        return "index";
    }
    @RequestMapping("toAdd")
    public String toAdd(){
        return "add";
    }
    @RequestMapping("add")
    public String add(User user){
        userService.saveUser(user);
        return "redirect:getUsers";
    }
    @RequestMapping("update")
    public String update(User user){
        userService.updateUser(user);
        return "redirect:getUsers";
    }
    @RequestMapping("delete")
    public String delete(int id){
        userService.delete(id);
        return "redirect:getUsers";
    }
}
