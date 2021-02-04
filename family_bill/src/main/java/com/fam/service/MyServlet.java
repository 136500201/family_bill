package com.fam.service;

import com.alibaba.fastjson.JSON;
import com.fam.dao.ExpenditureDao;
import com.fam.model.Expenditure;
import com.fam.util.MybatisHelper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class MyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SqlSessionFactory sqlSessionFactory = MybatisHelper.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Expenditure expenditure = null;
        //查询数据库
        try {
            ExpenditureDao mapper = sqlSession.getMapper(ExpenditureDao.class);
            expenditure = mapper.selectById(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        //传值给前端
        request.setAttribute("expenditure",expenditure);
        request.getRequestDispatcher("/billCal.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){

    }
}
