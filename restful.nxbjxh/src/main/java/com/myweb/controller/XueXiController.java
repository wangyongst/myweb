package com.myweb.controller;


import com.framework.utils.Result;
import com.myweb.pojo.*;
import com.myweb.pojo.Number;
import com.myweb.service.XueXiService;
import com.myweb.vo.XueFenVo;
import com.myweb.vo.XueXiVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/xuexi")
public class XueXiController {

    @Autowired
    private XueXiService xueXiService;


    //修改
    @ResponseBody
    @RequestMapping(value = "updateUser", method = RequestMethod.POST)
    public Result updateUser(HttpSession session, @ModelAttribute User user) {
        return xueXiService.updateUser(session,user);
    }

    //修改
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public ModelAndView update(HttpSession session) {
        Map map = new HashMap();
        return new ModelAndView("xuexi/update",xueXiService.update(session,map));
    }

    //首页
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        Map map = new HashMap();
        return new ModelAndView("xuexi/home");
    }

    //首页
    @RequestMapping(value = "courses", method = RequestMethod.GET)
    public ModelAndView coursehome(HttpSession session) {
        Map map = new HashMap();
        return new ModelAndView("xuexi/courses", xueXiService.makeHome(session,map));
    }

    //Course
    @RequestMapping(value = "course", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session,@ModelAttribute Course course) {
        Map map = new HashMap();
        return new ModelAndView("xuexi/lessons", xueXiService.makeLessons(session,course,map));
    }

    //Lesson
    @RequestMapping(value = "lesson", method = RequestMethod.GET)
    public ModelAndView lesson(HttpSession session, @ModelAttribute Lesson lesson) {
        Map map = new HashMap();
        return new ModelAndView("xuexi/xuexi", xueXiService.makeLesson(session,lesson,map));
    }

    //postTest
    @ResponseBody
    @RequestMapping(value = "post/test", method = RequestMethod.POST)
    public Result postTest(HttpSession session, @ModelAttribute Lesson lesson,@RequestParam String yes) {
        return xueXiService.postTest(session,lesson,yes);
    }

    //getTest
    @ResponseBody
    @RequestMapping(value = "get/test", method = RequestMethod.GET)
    public Result getTest(HttpSession session, @ModelAttribute Lesson Lesson, @ModelAttribute Test test) {
        return xueXiService.getTest(session,Lesson,test);
    }

    //getXueFen
    @ResponseBody
    @RequestMapping(value = "get/xuefen", method = RequestMethod.GET)
    public List<XueFenVo> getXueFen(HttpSession session) {
        return xueXiService.getXueFen(session);
    }

    //getXueXi
    @ResponseBody
    @RequestMapping(value = "get/xuexi", method = RequestMethod.GET)
    public List<XueXiVo> getXueXi(HttpSession session, @ModelAttribute Lessonrecord lessonrecord) {
        return xueXiService.getXueXi(session,lessonrecord);
    }

    //绑定
    @ResponseBody
    @RequestMapping(value = "post/band", method = RequestMethod.POST)
    public Result postBand(HttpSession session, @ModelAttribute Number number, @RequestParam ( "course" )  Integer course) {
        return xueXiService.postBand(session,number,course);
    }

    //学分
    @RequestMapping(value = "xuefen", method = RequestMethod.GET)
    public ModelAndView xuefen(HttpSession session) {
        return new ModelAndView("xuexi/xuefen");
    }
}
