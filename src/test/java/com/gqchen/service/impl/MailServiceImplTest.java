package com.gqchen.service.impl;

import com.gqchen.service.MailService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MailServiceImplTest {

    @Autowired
    private MailService service;

    @Test
    void sendSimplemail() {

    service.sendSimpleMail("chengq7@asiainfo.com","测试邮件","邮件无任何内容");

    }
}